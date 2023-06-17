import 'package:get/get.dart';

import 'home_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
  }
}