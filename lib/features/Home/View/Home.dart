import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:softvence/App/routes.dart';

import '../Controller/Controller.dart';
class home extends StatelessWidget {
  home({super.key});
  final controller = Get.find<homeController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome! Your Smart Travel Alarm",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                Text(
                  "Stay on schedule and enjoy every moment of your journey.",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: CachedNetworkImage(
                      imageUrl: "https://miro.medium.com/v2/resize:fit:2000/0*0v3IvNZT5toH7XbP",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: const Color(0xFF1e40af),
                        child: const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: const Color(0xFF1e40af),
                        child: const Center(
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.white,
                            size: 48,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),

                Obx(() {
                  if (controller.currentPosition.value == null) {
                    return Text(controller.locationStatus.value, style: TextStyle(color: Colors.white),);
                  } else {
                    final pos = controller.currentPosition.value!;
                    return Text(
                      "Latitude: ${pos.latitude}\nLongitude: ${pos.longitude}\nAccuracy: ${pos.accuracy} m",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    );
                  }
                }),

                const SizedBox(height: 10,),

                GestureDetector(
                  onTap: () {
                    controller.getCurrentLocation();
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.grey
                      )
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5,
                      children: [
                        Text("Use Current Location", style: TextStyle(fontSize: 18, color: Colors.white),),
                        Icon(Icons.location_on_outlined, color: Colors.white, size: 30,)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(routes.alarm_screen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5200FF),
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  child: Text("Home", style: TextStyle(color: Colors.white, fontSize: 22),),
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}



