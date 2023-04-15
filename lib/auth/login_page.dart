/*
  Flutter UI
  ----------
  lib/screens/simple_login.dart
*/

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:foryourservice/auth/register_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../Home.dart';
import '../NameOfClass.dart';
import '../constant.dart';
import '../view_model/login_view_model.dart';
import '../widget/MicButton.dart';
import '../widget/form_button.dart';
import '../widget/input_field.dart';


class LoginPage extends GetWidget<LoginViewModel>  {
  final FlutterTts flutterTts = FlutterTts();
 SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
 
  }

  @override
  Widget build(BuildContext context)  {
    double screenHeight = MediaQuery.of(context).size.height;
    final controller = Get.put(LoginViewModel());
    NameOfClass _nameclass=NameOfClass();

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
                  // image:  DecorationImage(
                  //   alignment: Alignment.center,
                  //   scale: 2.5,
                    
                  //   // image: AssetImage("images/logo.png"),
                  // ),
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
                errorText: controller.emailError,
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
              onPressed: controller.speak,
              // onPressed: controller.submitLogin,
              ),

            SizedBox(
              height: screenHeight * .015,
            ),
            TextButton(
                 onPressed: () {
                  // Get.to(RegisterPage());
                  Get.toNamed('/RegisterPage');
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

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MicButton(className:_nameclass.LoginModel,Controller:_nameclass.Login),
    );
  }
}
