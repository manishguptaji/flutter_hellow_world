import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_resume/login/login_binding.dart';
import 'package:my_resume/login/login.dart';

void main() {
  LoginBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginApp(),
      initialBinding: LoginBinding(),
      builder: EasyLoading.init(),
    );
  }
}