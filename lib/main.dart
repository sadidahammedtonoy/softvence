import 'package:flutter/material.dart';


import 'App/App.dart';
import 'Helper/NotificationService.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();

  runApp(const MyApp());
}
