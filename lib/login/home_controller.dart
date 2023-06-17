import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import 'LoginModel.dart';

class HomeController extends GetxController {
  LoginModel? loginModel;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  Future<bool> getApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('https://run.mocky.io/v3/2144ea90-a1e3-48d0-90f6-123eca962012')!
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        loginModel = LoginModel.fromJson(result);
      }

      return true;
    } catch (e) {
      print('Error while getting data is $e');
      return false;
    } finally {
      isDataLoading(false);
    }
  }
}
