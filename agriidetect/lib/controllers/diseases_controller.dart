import 'dart:convert';


import 'package:agriidetect/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/diseaes_model.dart';
import '../utils/api_endpoints.dart';

class DiseasesController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future<void> diseasesstore() async {
    final SharedPreferences? prefs = await _prefs;
    var token=prefs?.get('token');
    print(token);
    var headers = {   'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.diseases);
      Map<String ,dynamic> request={
'disease_id':'1',
'body':'hvhjvkkkkkkkkkkkhvkhkvjhvhjk'


      };
      http.Response response =
          await http.delete(url, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
print(json);

      }
    } catch (error) {
      Get.back();
      showAlertDialog(Get.context!,"No Internet","Check your internet connection.");
    }
  }
  Future<Disease> getdisease() async {

    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.diseases);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {


      return Disease.fromJson(json.decode(response.body)) ;}
    else {
      throw Exception('Failed to load ');
    }
  }
}
void showAlertDialog(BuildContext context, String ttle,String message){
  Widget okButton=TextButton(onPressed: (){
    Navigator.of(context).pop();
  }, child: Text("Okay"));
  AlertDialog alert=AlertDialog(title: Text(ttle),content: Text(message),
    actions: [okButton],);
  showDialog(context: context, builder: (BuildContext context){
    return alert;
  });
}