import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/Controller.dart';
import '../Model/Model.dart';

class NotificationBottomSheet {
  static void show() {
    final _titleController = TextEditingController();
    final _bodyController = TextEditingController();
    DateTime? _selectedDateTime;

    final NotificationController controller = Get.find();

    Get.bottomSheet(
      barrierColor: Colors.black.withOpacity(0.5),
      Padding(
        padding: EdgeInsets.only(
            bottom: Get.mediaQuery.viewInsets.bottom, top: 20, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Set Notification",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(_selectedDateTime == null
                      ? "No time selected"
                      : "Time: ${_selectedDateTime.toString()}"),
                ),
                TextButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: Get.context!,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: Get.context!,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickedTime != null) {
                        _selectedDateTime = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );
                      }
                    }
                  },
                  child: const Text("Pick Time"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isEmpty ||
                    _bodyController.text.isEmpty ||
                    _selectedDateTime == null) {
                  Get.snackbar("Error", "Please fill all fields",
                      snackPosition: SnackPosition.BOTTOM);
                  return;
                }

                final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

                controller.addNotification(MyNotification(
                  id: id,
                  title: _titleController.text,
                  body: _bodyController.text,
                  dateTime: _selectedDateTime!,
                ));

                Get.back();
                Get.snackbar("Success", "Notification Added",
                    snackPosition: SnackPosition.BOTTOM);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: const Color(0xFF5200FF),
              ),
              child: const Text("Set Alarm", style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
    );
  }
}
