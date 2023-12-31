import 'package:agriidetect/ui/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/camera.dart';




void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Onboarding Screen',
      home: SetPhotoScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
