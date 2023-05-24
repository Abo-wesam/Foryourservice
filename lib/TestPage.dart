import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'helper/constant.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  FlutterTts flutterTts =FlutterTts();
  List<String> listFromFirebase = [];
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    initializeTextToSpeech();
    fetchListFromFirebase();
  }

  void initializeTextToSpeech() async {
    await flutterTts.setLanguage('en-US');  }

  void fetchListFromFirebase() {
    DataOfService.forEach((element) {
      listFromFirebase.add(element.NameService);
    });
  }

  void speakListItems() async {
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

  int findSelectedIndex(String spokenText) {
    for (int i = 0; i < listFromFirebase.length; i++) {
      String listItem = listFromFirebase[i];
      if (spokenText.toLowerCase().contains(listItem.toLowerCase())) {
        return i;
      }
    }
    return -1; // Not found
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected index: $selectedIndex'),
            ElevatedButton(
              onPressed: speakListItems,
              child: Text('Speak list items'),
            ),
          ],
        ),
      ),
    );
  }
}