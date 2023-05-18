
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foryourservice/view_model/SpeechController.dart';
import '../auth/Dashboard/dashboard.dart';
import '../auth/login_page.dart';
import '../views/Home_Page.dart';
import '../views/Profile.dart';

class Dashbordcontent{

  
static  Widget hedercontent(int currentIndex, String user) {
if(user=='Customer'){
  return
    Center(child:currentIndex == 0?
    Text('Home'): currentIndex == 1?
    Text('Profile'):Text('schedule'));

}else{
  return
    Center(child:currentIndex == 0?
    Text('Home'):
    currentIndex == 1?
    Text('Profile'):
    currentIndex == 2?
    Text('schedule'):
    Text('Setting'));

}

  }

  static  List<Widget> getchildren(String user) {
  if(user=='Customer'){
    return <Widget>[
      HomePage(),
      Profile(),
      HomePage(),
    ];
  }else{
    return <Widget>[
      HomePage(),
      Profile(),
      HomePage(),
      LoginPage(),

    ];
  }

  }

static  List<Widget> ContentOfdownbar(String user, Size size, setBottomBarIndex, int currentIndex, SpeechController speech) {
  if(user=='Customer'){
    return  <Widget>[
      CustomPaint(
        size: Size(size.width, 80),
        painter: BNBCustomPainter(),
      ),
      Center(
        heightFactor: 0.6,
        child: FloatingActionButton(
            backgroundColor: Colors.orange,
            child: Icon(speech.isListening.value
                ? Icons.mic
                : Icons.mic_none),
            elevation: 0.1,
            onPressed: () {
              speech.listen();
            }),
      ),
      Container(
        width: size.width,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: currentIndex == 0
                    ? Colors.orange
                    : Colors.grey.shade400,
              ),
              onPressed: () {
                setBottomBarIndex(0);
              },
              splashColor: Colors.white,
            ),
            IconButton(
                icon: Icon(
                  Icons.person,
                  color: currentIndex == 1
                      ? Colors.orange
                      : Colors.grey.shade400,
                ),
                onPressed: () {
                  setBottomBarIndex(1);
                }),
            Container(
              width: size.width * 0.20,
            ),
            IconButton(
                icon: Icon(
                  Icons.schedule,
                  color: currentIndex == 2
                      ? Colors.orange
                      : Colors.grey.shade400,
                ),
                onPressed: () {
                  setBottomBarIndex(2);
                }),

          ],
        ),
      )
    ];

  
  }
  else{
    return <Widget>[
      CustomPaint(
        size: Size(size.width, 80),
        painter: BNBCustomPainter(),
      ),
      Center(
        heightFactor: 0.6,
        child: FloatingActionButton(
            backgroundColor: Colors.orange,
            child: Icon(speech.isListening.value
                ? Icons.mic
                : Icons.mic_none),
            elevation: 0.1,
            onPressed: () {
              speech.listen();
            }),
      ),
      Container(
        width: size.width,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: currentIndex == 0
                    ? Colors.orange
                    : Colors.grey.shade400,
              ),
              onPressed: () {
                setBottomBarIndex(0);
              },
              splashColor: Colors.white,
            ),
            IconButton(
                icon: Icon(
                  Icons.person,
                  color: currentIndex == 1
                      ? Colors.orange
                      : Colors.grey.shade400,
                ),
                onPressed: () {
                  setBottomBarIndex(1);
                }),
            Container(
              width: size.width * 0.20,
            ),
            IconButton(
                icon: Icon(
                  Icons.schedule,
                  color: currentIndex == 2
                      ? Colors.orange
                      : Colors.grey.shade400,
                ),
                onPressed: () {
                  setBottomBarIndex(2);
                }),
            IconButton(
                icon: Icon(
                  Icons.settings,
                  color: currentIndex == 3
                      ? Colors.orange
                      : Colors.grey.shade400,
                ),
                onPressed: () {
                  setBottomBarIndex(3);
                }),
          ],
        ),
      )
    ];
  }

}



}


