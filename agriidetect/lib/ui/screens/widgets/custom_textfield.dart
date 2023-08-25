
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';


class CustomTextfield extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;


   CustomTextfield( this.validator,this.textEditingController,this.icon ,this.obscureText,  this.hintText) ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
validator: validator,
      controller: textEditingController,
      obscureText: obscureText,
      style: TextStyle(
        color: Constants.blackColor,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(icon, color: Constants.blackColor.withOpacity(.3),),
        hintText: hintText,
      ),
      cursorColor: Constants.blackColor.withOpacity(.5),
    );
  }
}