import 'package:agriidetect/ui/screens/signin_page.dart';
import 'package:agriidetect/ui/screens/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:page_transition/page_transition.dart';


import '../../controllers/login_controller.dart';
import '../../controllers/registeration_controller.dart';
import '../../utils/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formkey1 = GlobalKey<FormState>();
  RegisterationController registerationController =
  Get.put(RegisterationController());

  LoginController loginController = Get.put(LoginController());
  RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  var isLogin = false.obs;
  bool locked = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child:Form(
            autovalidateMode: AutovalidateMode.always,//check for validation while typing
            key: formkey1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/Signup.png'),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
               CustomTextfield(

                     (value) {
                   if (value!.isEmpty) {
                     return "* Required";
                   }
                   return null;
                 },
                 registerationController.nameController,
                  Icons.person,
                 false,
                 'Enter Full name',

              ),
              CustomTextfield(
                    (value) {
                  if (value!.isEmpty) {
                    return "* Required";
                  } else if (!emailRegExp.hasMatch(value)) {
                    return "Email is invalid";
                  } else {
                    return null;
                  }
                },
                registerationController.emailController,
               Icons.alternate_email,
                false,
                'Enter Email',
              ),

              TextFormField(
                obscureText: locked,
              validator:  MultiValidator([
                  RequiredValidator(errorText: "* Required"),
                  MinLengthValidator(6,
                      errorText: "Password should be atleast 6 characters"),
                  MaxLengthValidator(15,
                      errorText:
                      "Password should not be greater than 15 characters")
                ]),
               controller: registerationController.passwordController,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(locked ? Icons.lock : Icons.lock_open, color: Constants.blackColor.withOpacity(.3),),

                    onPressed: () {
                      setState(() {
                        locked = !locked;
                      });
                    },
                  ),
                  hintText: 'Enter a Password',
                  border: InputBorder.none,
                ),

              ),

              CustomTextfield(
                 (value){
                  if(value!.isEmpty)
                    return '* Required';
                  if(value != registerationController.passwordController.text)
                    return 'Not Match';

                },
                registerationController.confirmPass,
                Icons.lock,
                 true,
                'Confirm Password',

              ),

              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {

    if(formkey1.currentState!.validate()) {

                registerationController.registerWithEmail();}},
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const SignIn(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Have an Account? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),



        )











      ),
    );

  }

}
