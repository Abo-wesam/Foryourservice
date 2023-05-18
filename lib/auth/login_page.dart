/*
  Flutter UI
  ----------
  lib/screens/simple_login.dart
*/

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Home.dart';
import '../view_model/SpeechController.dart';
import '../view_model/login_view_model.dart';
import '../widget/form_button.dart';
import '../widget/input_field.dart';


class LoginPage extends GetWidget<LoginViewModel>  {
  const LoginPage({super.key});

  
  @override
  Widget build(BuildContext context)  {

    double screenHeight = MediaQuery.of(context).size.height;
     final speech = Get.put(SpeechController());
     controller.userstatues();
    // NameOfClass _nameclass=NameOfClass();

    return Scaffold(


      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
          Get.to(Home());

        },),

        //  title: const Text('Home'),
        title: Center(child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SizedBox(width: 90,),Text('Login')],))),

        // backgroundColor: Colors.,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
         // key: _globalKey,
          shrinkWrap: true,
          children: [
            SizedBox(height: screenHeight * .02),
            Container(

              margin: const EdgeInsets.all(9),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image:  const DecorationImage(
                    alignment: Alignment.center,
                    scale: 2.5,

                    image: AssetImage("assets/images/loog.png"),
                  ),
                  border: Border.all(
                      width: 1.5,
                      color: Colors.blueAccent,
                      style: BorderStyle.solid),
                  shape: BoxShape.circle,
                ),
              ),
            
            
            SizedBox(
              height: screenHeight * .1),

                InputField(
                onChanged: (value) {
                    controller.email= value;
                  
                },

                labelText: "Email",
                // errorText: controller.emailError,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autoFocus: true,
              ),

            SizedBox(
              height: screenHeight * .025),

              InputField(
                onChanged: (value) {
                  
                    controller.password = value;
                  
                },
                //onSubmitted: (val) => controller.submit(),
                labelText: "Password",
                errorText: controller.passwordError,
                obscureText: true,
           textInputAction: TextInputAction.next,
         ),


            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Get.to(PasswordPage());
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * .075,
            ),
            FormButton(

              text: "Log In",
              onPressed:controller.submitLogin,
              // onPressed: controller.submitLogin,
              ),

            SizedBox(
              height: screenHeight * .015,
            ),
            TextButton(
                 onPressed: () {
                  // Get.to(RegisterPage());
                   controller.GoToRegister();
                  // Get.toNamed('/RegisterPage');
                 },
                
                child: RichText(
                  text: const TextSpan(
                    text: "I'm a new user, ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),


          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Obx(
      //         ()=>AvatarGlow(
      //       animate: speech.isListening.value,
      //       glowColor: Colors.blue,
      //       endRadius: 90.0,
      //       duration: Duration(milliseconds: 2000),
      //       repeat: true,
      //       repeatPauseDuration: Duration(milliseconds: 100),
      //       child: FloatingActionButton(
      //         child: Icon(speech.isListening.value?Icons.mic:Icons.mic_none),
      //         onPressed: (){
      //           speech.listen();},
      //
      //       ),
      //
      //
      //     )
      // ),

    );
  }
}
