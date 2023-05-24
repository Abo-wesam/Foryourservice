
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart'as ss;
import '../Disabled_person/Speech.dart';

class SpeechController extends GetxController{
  Speech Spake=Speech();
  final FlutterTts flutterTts = FlutterTts();
  late Timer _timer;
  var isListening =false.obs;
  bool _speechEnabled = false;
  ss.SpeechToText _speechToText =  ss.SpeechToText();
  late String  speechText;
  var pageName='Login'.obs;
  var UserName=''.obs;
  var Password=''.obs;
  @override
  void onInit(){
    // _Speech.speak("Login");
    super.onInit();
  //  speechToText=SpeechToText();
  }
  @override
  void onReady(){

  }
  @override
  void dispose() {
    _speechToText.stop();
    super.dispose();
  }


  void listen() async {
    print (_speechEnabled);
    _stopListening();
    if(!isListening.value){
      _initSpeech();
      print(_speechEnabled);
      if(_speechEnabled){
        isListening.value=true;
        _startListening();
      }
    }
    else{
      print('else');
      isListening.value=false;
      _stopListening();
      speechText='noRecord';

    }
  }
  void _initSpeech() async {
    // var local =_speechToText.locales();
    // var selectedLocale = local[selectedLocale];
    _speechEnabled = await _speechToText.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
      debugLogging: true,
    );
    print(_speechEnabled);

  }

  void _startListening() async {
    // await _speechToText.listen(onResult: _onSpeechResult,);
    await _speechToText.listen(onResult:(result){
      speechText = result.recognizedWords;

    },
        cancelOnError: true,
        partialResults: true,
        onSoundLevelChange: (level) {
      if (level == 0.0) {
        _speechToText.stop();
      } }

    );

  }
  void _stopListening() async {
    await _speechToText.stop();
    isListening.value=false;
    print(isListening.value);



  }

  void _onSpeechResult(SpeechRecognitionResult result) async{
    speechText = result.recognizedWords;

    _timer = Timer(Duration(seconds: 2), () {
      _stopListening();
    });


  }

 void HandlingVoic() async {
   isListening.value=false;
   print(isListening.value);
    if(pageName=='Login'){
      // Spake.speak("مرحبا بكم");
       Spake.speak("Hi bro you are in login page now take your User Name");
       await flutterTts.awaitSpeakCompletion(true);
       listen();
       await Future.delayed(Duration(seconds: 7));
       // await Future.delayed(Duration(seconds: 8));
      UserName.value=speechText;
       print('Text:='+UserName.value +'  '+speechText);
       _stopListening();
       Spake.speak("Now take your Password");
       await flutterTts.awaitSpeakCompletion(true);
       await Future.delayed(Duration(seconds: 3));
       listen();
       await Future.delayed(Duration(seconds: 7));
       Password.value=speechText;
       print('result:='+Password.value+'  '+UserName.value);
       if(UserName.value=='one'&&Password.value=='one'){
        print('Wellcome to HOme Page ');
      }else{
         print('Wellcome to HOme Page ');

       }
       // _stopListening();



      // _timer = Timer(Duration(seconds: 10), () {
      //   _stopListening();
      // });
      // listen();
      // print(speechText.value);
      // await flutterTts.speak("Now take your User password");
      // print(speechText.value);



    }

  }
  /*
  void speakListItems() async {

    List<String> listFromFirebase = [];
    for (String listItem in listFromFirebase) {
      await flutterTts.speak(listItem);
    }
    String lastSpokenText = await flutterTts.stop();
    int index = findSelectedIndex(lastSpokenText);
    if (index != -1) {
      setState(() {
        selectedIndex = index;
      });
    }
  }
  List<String> listFromFirebase = [];
*/


}