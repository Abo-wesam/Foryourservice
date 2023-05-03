


import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../view_model/SpeechController.dart';


class Speech {

  RxString _recognizedText = ''.obs;
    SpeechToText _speech = SpeechToText();
  final FlutterTts flutterTts = FlutterTts();
  bool _isListening = false;
  bool _speechEnabled = false;
  List<LocaleName> _localeNames = [];
  String _currentLocaleId = '';

 Future<void>  speak(String Text) async {

    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setLanguage("en-US");
    // await flutterTts.setLanguage('ar');
    // await flutterTts.setVoice({
    //   "name": "en-US-Wavenet-D"
    //
    //
    // });
    // await flutterTts.setLanguage('ar-SA');
    await flutterTts.setPitch(1.0);
    await flutterTts.setVolume(1.0);

    await flutterTts.speak(Text);
    await flutterTts.awaitSpeakCompletion(true);





    }


 }