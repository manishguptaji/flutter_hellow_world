import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ListController extends GetxController {
  final List<Map<String, String>> countries = [
    {"name": "India", "capital": "delhi"},
    {"name": "Japan", "capital": "Tokyo"},
    {"name": "England", "capital": "London"},
    {"name": "China", "capital": "Beijing"}
  ];

  Rx<List<Map<String, String>>> filterData = Rx<List<Map<String, String>>>([]);

  @override
  Future<void> onInit() async {
    super.onInit();

    filterData.value = countries;
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  void filterDataBy(String name) {
    List<Map<String, String>> result = [];

    if (name.isEmpty) {
      result = countries;
    } else {
      result = countries
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(name.toLowerCase()))
          .toList();
    }

    filterData.value = result;
  }
}
