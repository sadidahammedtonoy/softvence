import 'package:flutter/material.dart';
import '../Controller/Controller.dart';
import '../Model/Model.dart';
import '../Widgets/add_alarm.dart';
import 'package:get/get.dart';

class alarm extends StatelessWidget {
  alarm({super.key});
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0B0024), Color(0xFF082257), Color(0xFF082257)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity,),



                Text("Selected Location", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF201A43),
                    hintText: "Add your location",
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.location_on_outlined, color: Colors.white),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10,),

                Text("Alarms", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),),

                const SizedBox(height: 20,),
                Expanded(
                  child: Obx(
                        () => ListView.builder(
                      itemCount: controller.notifications.length,
                      itemBuilder: (context, index) {
                        MyNotification notification = controller.notifications[index];

                        final timeStr =
                            "${notification.dateTime.hour.toString().padLeft(2, '0')}:${notification.dateTime.minute.toString().padLeft(2, '0')}";
                        final dateStr =
                            "${_getWeekday(notification.dateTime.weekday)} ${notification.dateTime.day} ${_getMonth(notification.dateTime.month)} ${notification.dateTime.year}";

                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          color: const Color(0xFF201A43),
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              children: [
                                Text(
                                  timeStr,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),

                                const SizedBox(width: 16),

                                Expanded(
                                  child: Text(
                                    "${notification.body}\n$dateStr",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),

                                Switch(
                                  value: notification.isActive,
                                  onChanged: (value) {
                                    controller.toggleNotification(notification, value);
                                  },
                                  activeColor: Color(0xFF5200FF),
                                  thumbColor: MaterialStateProperty.resolveWith<Color?>(
                                        (states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return Colors.white;
                                      }
                                      return Colors.white;
                                    },
                                  ),
                                )

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),




              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        NotificationBottomSheet.show();
      },
        shape: CircleBorder(),
        backgroundColor: Color(0xFF5200FF),
      child: Icon(Icons.add, color: Colors.white,),),
    );
  }
}


// Helper functions to convert weekday/month number to string
String _getWeekday(int weekday) {
  switch (weekday) {
    case 1:
      return "Mon";
    case 2:
      return "Tue";
    case 3:
      return "Wed";
    case 4:
      return "Thu";
    case 5:
      return "Fri";
    case 6:
      return "Sat";
    case 7:
      return "Sun";
    default:
      return "";
  }
}

String _getMonth(int month) {
  switch (month) {
    case 1:
      return "Jan";
    case 2:
      return "Feb";
    case 3:
      return "Mar";
    case 4:
      return "Apr";
    case 5:
      return "May";
    case 6:
      return "Jun";
    case 7:
      return "Jul";
    case 8:
      return "Aug";
    case 9:
      return "Sep";
    case 10:
      return "Oct";
    case 11:
      return "Nov";
    case 12:
      return "Dec";
    default:
      return "";
  }
}