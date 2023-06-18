import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListController extends GetxController {
  final List<Map<String, String>> countries = [
    {"name": "India", "capital": "delhi"},
    {"name": "Japan", "capital": "Tokyo"},
    {"name": "England", "capital": "London"},
    {"name": "China", "capital": "Beijing"}
  ];

  Rx<List<Map<String, String>>> filterData = Rx<List<Map<String, String>>>([]);

  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    filterData.value = countries;
    getRandomString();
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

  Future<String> getRandomString() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('https://run.mocky.io/v3/2144ea90-a1e3-48d0-90f6-123eca962012')!
      );

      var result = jsonDecode(response.body);

      return result;
    } catch (e) {
      print('Error while getting data is $e');
      return "";
    } finally {
      isDataLoading(false);
    }
  }
}
