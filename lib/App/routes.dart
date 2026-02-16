import 'package:get/get.dart';
import '../features/Alarm/View/Alarm.dart';
import '../features/Home/View/Home.dart';
import '../features/OnBoarding/View/OnBoarding.dart';
import 'Binding.dart';

class routes {
  static const String OnboardingScreen_screen = '/OnboardingScreen';
  static const String home_screen = '/home';
  static const String alarm_screen = '/alarm';



  static final pages = [
    GetPage( name: OnboardingScreen_screen, binding: InitialBinding(), page: () => OnboardingScreen()),
    GetPage( name: home_screen, binding: InitialBinding(), page: () => home()),
    GetPage( name: alarm_screen, binding: InitialBinding(), page: () => alarm()),



  ];
}


