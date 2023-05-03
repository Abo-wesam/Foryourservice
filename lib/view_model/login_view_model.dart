


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Disabled_person/Speech.dart';
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
    Get.to(dashboard());
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
 void  GoToRegister (){
    print('test');
    Get.to(() => RegisterPage());
    // Get.to( RegisterPage());

  }

}