import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';


class Speech {
  
  RxString _recognizedText = ''.obs;
  static final _speech = SpeechToText();
  final FlutterTts flutterTts = FlutterTts();
  bool _isListening = false;
  bool _speechEnabled = false;


void _startListening() async {
  
//  var locales = await _speech.locales();
    await _speech.listen(onResult: _onSpeechResult);
    
  }
  void _stopListening() async {
    await _speech.stop();
  
  }
  void _onSpeechResult(SpeechRecognitionResult result) {
   
      _recognizedText = result.recognizedWords as RxString;
      print(_recognizedText);
  
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.


  Future<void> speak() async {
   

     await flutterTts.setSpeechRate(0.5);
    await flutterTts.setLanguage("en-US");
    // await flutterTts.setLanguage('ar-SA');
    await flutterTts.setPitch(1.0);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak("Hi bro you are in login page now please take your User name");
   
    SpeechToTexts();
  }
  void SpeechToTexts() async {

     _speech.isNotListening ? _startListening : _stopListening ;
    bool available = await _speech.initialize();
    print(available);
    if (available) {
    _startListening();
    _stopListening();
    } else {
      print('Speech to text is not available');
    }
  }

 }