


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Disabled_person/Speech.dart';
import '../Services/FirebaseAuth.dart';
import '../auth/Admin/MainAdmin.dart';
import '../auth/Dashboard/dashboard.dart';
import '../auth/register_page.dart';
import 'SpeechController.dart';




class LoginViewModel extends GetxController {
  // SpeechController spech=Get.put(SpeechController());
  Speech _Speech = Speech();
  late String email, password;
  String? emailError, passwordError;
  @override
  void onInit() {
    // spech.HandlingVoic();
   // _Speech.speak("Login");
    email = "";
    password = "";
    emailError = '';
    passwordError = '';
    super.onInit();
  }

  void resetErrorText() {
    emailError = '';
    passwordError = '';
    update();
  }

  bool validateLogin() {
    //check method
    resetErrorText();

    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValid = true;
    if (email.isEmpty || !emailExp.hasMatch(email)) {
      emailError = "Email is invalid";
      isValid = false;
    }

    if (password.isEmpty) {
      passwordError = "Please enter a password";

      isValid = false;
    }

    return isValid;
  }

  void speak()  {
   print('log');
    // _Speech.Speechs();
     // _Speech.speak("Login");
  }

  void submitLogin()async {

    // BuildContext context;
    // Get.to(MainScreen());
    // SharedPreferences _prefe=await SharedPreferences.getInstance();
    //
    if (validateLogin()) {
      Firebase_Auth().Login(email,password);
    }else{

      print('false');
    }



  }


 //
 // void  handlePasswordReset()async {
 //    try{
 //      await  _auth.sendPasswordResetEmail(email: email);
 //
 //    }on FirebaseAuthException catch (e){
 //      print(e.message);
 //    }
 //
 //    catch(e){
 //      Get.snackbar('Reset Password', 'Error in sending password reset email');
 //
 //    }
 //  }
 void  GoToRegister (){
    print('test');
    Get.to(() => RegisterPage());
    // Get.to( RegisterPage());

  }

}