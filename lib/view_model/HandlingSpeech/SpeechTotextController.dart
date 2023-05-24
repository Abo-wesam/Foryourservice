import 'dart:developer';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:foryourservice/helper/constant.dart';
import 'package:foryourservice/model/Binding/Service.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../model/Binding/CompanyModel.dart';
import 'ISpeechTotext.dart';

class SpeechTotextController extends GetxController implements ISpeechTotext {
  ///Definition  flutterTts
  FlutterTts flutterTts = FlutterTts();
  List<String> listFrommodel = [];
  int selectedIndex = -1;

  ///Definition  speech To Text
  SpeechToText speech = SpeechToText();
  bool isListening = false;
  String transcription = '';

  @override
  void onInit() {
    super.onInit();
    initializeTextToSpeech();
    initSpeechState();
  }

  @override
  void dispose() {
    listFrommodel=[];
    super.dispose();
  }

void initializeTextToSpeech() async {
    await flutterTts.setLanguage('en-US');
  }
  @override
  void speakListHome(List<Service> _dataOfService) async {
    _dataOfService.forEach((o) {
      listFrommodel.add(o.NameService);
      print(listFrommodel.length);
    });
    for (int i = 0; i < listFrommodel.length; i++) {
      String listItem = listFrommodel[i];
      await flutterTts.speak("${i} ${listItem}");
    }
    // for (String listItem in listFrommodel) {
    //   print(listItem);
    //   await flutterTts.speak(listItem);
    // }
    String lastSpokenText = await flutterTts.stop();
    int index = findSelectedIndex(lastSpokenText);
    if (index != -1) {
      print(index);
      selectedIndex = index;
      update();
    }
    listFrommodel.clear();
  }

  int findSelectedIndex(String spokenText) {
    print('stsrt');
    for (int i = 0; i < listFrommodel.length; i++) {
      String listItem = listFrommodel[i];
      if (spokenText.toLowerCase().contains(listItem.toLowerCase())) {
        return i;
      }
    }
    return -1; // Not found
  }

  @override
  void startListening() {
    speech.listen(
        onResult: (result) {
          transcription = result.recognizedWords;
          update();
        },
        // onError: (error) => print('Error: $error'),
        listenFor: Duration(seconds: 5),
        pauseFor: Duration(seconds: 5),
        partialResults: true,
        onSoundLevelChange: (level) => print('Sound level: $level'),
        cancelOnError: true);
    isListening = true;
    update();
  }

  @override
  void stopListening() {
    speech.stop();
    isListening = false;
    update();
  }

  void initSpeechState() {}

  @override
  void speakListcompanylist(List<UserModel> complist) async{
    listFrommodel.clear();
    complist.forEach((o) {
      listFrommodel.add(o.Name);
      print(o.Name);
    });
    print('fff${listFrommodel.length}');
    for (int i = 0; i < listFrommodel.length; i++) {
      String listItem = listFrommodel[i];
      await flutterTts.speak("${i} ${listItem}");
    }
    String lastSpokenText = await flutterTts.stop();
    int index = findSelectedIndex(lastSpokenText);
    if (index != -1) {
      print(index);
      selectedIndex = index;
      update();
    }
  }


  // handlinHomeSpoking(List<Service> _dataOfService) {
  //   print('hi to spech');
  //   _dataOfService.forEach((o) {
  //     listFrommodel.add(o.NameService);
  //   });
  //   print(listFrommodel.length);
  // }
}
