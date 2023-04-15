import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reflectable/reflectable.dart';
import '../MyReflectable.dart';
import '../NameOfClass.dart';
import '../constant.dart';
import '../view_model/login_view_model.dart';

class MicButton extends StatefulWidget {
  final String? className;
  late final  Object Controller ;
  MicButton( {
    this.className,   required this.Controller,
  });


  @override
  _MicButtonState createState() => _MicButtonState();
}

class _MicButtonState extends State<MicButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isRecording = false;
  late GetxController _controller;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  void vv() {
  setState((){
    Object n =widget.Controller;
  // final  controller = Get.put(dependency)<>()  ;

  });


  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTapDown: (_) => _startRecording(),
      onTapUp: (_) => _stopRecording(),
      // onTapCancel: _stopRecording,
      child: AvatarGlow(
        startDelay: Duration(milliseconds: 1000),
        glowColor: _isRecording ? Colors.red : Colors.white,
        endRadius: 75.5,
        duration: Duration(milliseconds: 2000),
        repeat: true,
        repeatPauseDuration: Duration(milliseconds: 100),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isRecording ? Colors.red : Colors.grey,
          ),
          child: Icon(
            Icons.mic,
            color: Colors.white,
            size: 40.0,
          ),
        ),
        animate: true,
        // animationDuration: Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  void _startRecording() async {


    // bool available = await SpeechToText.instance.initialize();
     bool available = true;
    if (available) {
      setState(() => _isRecording = true);
      //  SpeechToText.instance.listen(
      //   onResult: (text) {
      //     _animationController.repeat(reverse: true);
      //   },
      //   cancelOnError: true,
      // );
    } else {
      print("The speech recognition engine is not available.");
    }
  }

  void _stopRecording() {
    // SpeechToText.instance.stop();
    setState(() => _isRecording = false);
    _animationController.stop();
  }
}