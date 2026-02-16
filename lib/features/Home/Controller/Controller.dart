import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class homeController extends GetxController {
  var currentPosition = Rxn<Position>();
  var locationStatus = "Click to see Location.".obs;

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationStatus.value = "Location services are disabled.";
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationStatus.value = "Location permissions are denied";
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      locationStatus.value = "Location permissions are permanently denied";
      return;
    }

    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      currentPosition.value = position;
      locationStatus.value =
      "Lat: ${position.latitude}, Lng: ${position.longitude}";
    });
  }



}