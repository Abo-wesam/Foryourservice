import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';


class Speech {
  RxString _recognizedText = ''.obs;
    SpeechToText _speech = SpeechToText();
  final FlutterTts flutterTts = FlutterTts();
  bool _isListening = false;
  bool _speechEnabled = false;
  List<LocaleName> _localeNames = [];
  String _currentLocaleId = '';

  Future<void> speak(String Typepage) async {
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setLanguage("en-US");
    // await flutterTts.setLanguage('ar-SA');
    await flutterTts.setPitch(1.0);
    await flutterTts.setVolume(1.0);
    if(Typepage=="Login"){
      await flutterTts.speak("Hi bro you are in login page now please take your User name and password");



    }
    SpeechToTexts();
  }

  void Speechs()=>GotoRecord(onResult: (text)=>print('text:'+text),);

  void  GotoRecord({required Function(String text) onResult}) async {
    
      final availables=await _speech.initialize();
    _localeNames = await _speech.locales();

    var systemLocale = await _speech.systemLocale();
    _currentLocaleId = systemLocale?.localeId ?? '';

   print(availables);
     if(availables){
       _speech.listen( onResult: (result)=>onResult(result.recognizedWords),
         listenFor: Duration(seconds: 1),
         partialResults: true,
       localeId: _currentLocaleId,
       listenMode:  ListenMode.confirmation,);
     }

  }

  void SpeechToTexts() async {

   // _speech.isNotListening ? startListening : _stopListening ;
    bool available = await _speech.initialize();
    print(available);
    if (available) {
      startListening();
      _stopListening();
    } else {
      print('Speech to text is not available');
    }

  }

  void startListening() async {
    Timer(Duration(seconds: 5), () {
      _speech.stop();
    });
    print('Start to record');
    bool available = await _speech.initialize();
    if (available) {
      _speech.listen(
        onResult: (result) {
          print(result.recognizedWords);
          print('done');
        },
        // listenFor: Duration(seconds: 30),
        );
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }
// void _startListening() async {
//   print('Start to record');
//   _speech.listen(
//       onResult: (result) {
//         final ResultText = result.recognizedWords ;
//         print(ResultText);
//
//       },
//       cancelOnError: true,
//     );
//
//   }
  void _stopListening() async {
    print('Stop to record');
    await _speech.stop();
  
  }


  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.





 }