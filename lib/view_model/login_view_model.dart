import 'dart:convert';


import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Disabled_person/Speech.dart';




class LoginViewModel extends GetxController {
  Speech _Speech = Speech();
  // var authService = Get.find<AuthService>();
  late String email, password;
  String? emailError, passwordError;
  // late final Function(String? email, String? password)? onSubmitted;
  @override
  void onInit() {

    email = "";
    password = "";
    emailError = null;
    passwordError = null;
    super.onInit();
  }

  void resetErrorText() {
    emailError = null;
    passwordError = null;
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

  Future<void> speak() async {
    _Speech.SpeechToTexts();
  }

  void submitLogin()async {
    // SharedPreferences _prefe=await SharedPreferences.getInstance();
    //
    // if (validateLogin()) {
    //  await _auth.signInWithEmailAndPassword(email: email, password: password)
    //      .then((value) => print(value.user) );
    //  var user=_auth.currentUser;
    //  // String? email=user?.email;
    //  _prefe.setString(Data_Current_User, json.encode(user?.uid));
    // print(_prefe.getString(Data_Current_User));
    //  Get.snackbar('Login', 'Login successfully');
    //  AuthService().CheckForUser(email);
    //
    //  Get.to(Dashboard());
    //
    // } else {
    //   Get.snackbar('Login', 'Invalid email or password');
    // }
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
}