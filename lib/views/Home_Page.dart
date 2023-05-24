import 'package:flutter/material.dart';
import 'package:foryourservice/views/Companies.dart';
import 'package:get/get.dart';

import '../Services/FirebaseAuth.dart';
import '../helper/constant.dart';
import '../model/Binding/Routes.dart';
import '../view_model/HandlingSpeech/ISpeechTotext.dart';
import '../view_model/RequestController.dart';
import '../view_model/HandlingSpeech/SpeechTotextController.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final cntroller = Get.put(RequestController());
    // final Spechtext = Get.put(SpeechTotextController());
    // Spechtext.handlinHomeSpoking(DataOfService);

    return Scaffold(
      body:
          // ListView.separated(
          //    scrollDirection: Axis.horizontal,
          //   itemCount: announcements.length,
          //   itemBuilder: (context, index) {
          //     final announcement = announcements[index];
          Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: ListView.builder(
                itemCount: DataOfService.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      cntroller.comp_typ = DataOfService[index].typeComp;
                      _handleTap();
                    },
                    child: Container(
                      // height: 70,
                      // width: 30,
                      decoration: BoxDecoration(
                          color: kBgTempletColor,
                          border: Border.all(
                              width: 1,
                              color: Colors.blueGrey,
                              style: BorderStyle.solid),
                          // gradient: LinearGradient(
                          //   colors: [Colors.indigoAccent,Colors.orange],
                          //   begin: Alignment.centerLeft,
                          //   end:  Alignment.centerRight,
                          // ),
                          borderRadius: BorderRadius.all(Radius.circular(35))),
                      child: Column(children: [
                        SizedBox(height: screenHeight * .02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(9),
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      alignment: Alignment.center,
                                      scale: 2.5,
                                      image: AssetImage(
                                          'assets/images/image_taxi.png'),
                                    ),
                                    border: Border.all(
                                        width: 1.5,
                                        color: Colors.blueAccent,
                                        style: BorderStyle.solid),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(DataOfService[index].NameService),
                              ],
                            ),
                          ],
                        )
                      ]),
                    ),
                  );
                },
              )

              // const SizedBox(height: 50,),

              ),
      // },
      // separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),

      // )
    );
  }

  void _handleTap() {
    Get.toNamed(Routes.Request);
  }
}
