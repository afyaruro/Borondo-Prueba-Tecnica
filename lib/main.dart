import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica/App/MyApp.dart';
import 'package:prueba_tecnica/Infrastructure/Controllers/ControllerUser.dart';
import 'package:prueba_tecnica/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(ControllerUser());

  runApp(const MyApp());
}
