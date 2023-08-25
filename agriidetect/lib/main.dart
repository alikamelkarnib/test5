import 'package:agriidetect/ui/screens/signin_page.dart';
import 'package:flutter/material.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Onboarding Screen',
      home: SignIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}
