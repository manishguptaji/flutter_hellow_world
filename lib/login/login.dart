import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_resume/login/home_controller.dart';
import 'package:get/get.dart';
import 'package:my_resume/pager.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {

  HomeController dataController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.red[100],
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Center(
                  child: Container(
                    width: 200,
                    height: 100,
                    color: Colors.amber[100],
                    child: const Center(child: Text('WELCOME', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your email'),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password'),
                ),
                SizedBox(
                  height: 65,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      child: const Text( 'Log in ', style: TextStyle(color: Colors.white, fontSize: 20)),
                      onPressed: () async {
                        if(await dataController.getApi() == true) {
                          //EasyLoading.showSuccess(dataController.loginModel?.id ?? "");
                          Get.snackbar(
                            dataController.loginModel?.id ?? "",
                            "Hello everyone",
                            icon: Icon(Icons.person, color: Colors.white),
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                          );
                          Get.to(const Pager());
                        } else {
                          EasyLoading.showError('Error');
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}