import 'package:get/get.dart';
import 'package:my_resume/listview/list_controller.dart';

import 'home_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );

    Get.lazyPut<ListController>(
          () => ListController(),
    );
  }
}