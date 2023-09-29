import 'dart:convert';

import 'package:agriidetect/ui/home.dart';
import 'package:agriidetect/ui/screens/widgets/BottomNavBarState.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../utils/api_endpoints.dart';
import 'login_controller.dart';

class RegisterationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {

    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);
      Map body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text

      };

      http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['status']==true) {
          Get.back();
          showAlertDialog(Get.context!, "SUCCESS", "Please Sign in to your Account");
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          confirmPass.clear();

         Get.off(BottomNavBarState());

        }   else{
          showAlertDialog(Get.context!,"ERROR","Email already been used");
      }
      }
    } catch (e) {
      showAlertDialog(Get.context!,"No Internet","Check your internet connection.");

    }
  }
}
