import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../helper/constant.dart';
import '../../model/Binding/CompanyModel.dart';
import '../../view_model/HandlingSpeech/ISpeechTotext.dart';
import '../../view_model/RequestController.dart';
import '../../view_model/SettingController.dart';
import 'Requestscomponent/StepperComponent.dart';

class RequestPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    RequestController req=RequestController();

    // final Map<String, int?> args = Get.arguments;
    // print(args['comptyp']);


    final appBer = AppBar(
      title: const Text('Request'),
      elevation: 0,
      centerTitle: true,
      leading: BackButton(
        onPressed: () {
          Get.back();
        },
        color: Colors.white, // <-- SEE HERE
      ),
    );

    final double hightScreen =
        hightscreenSize(context) - appBer.preferredSize.height;
    final widthScrren = widthscreenSize(context);
    final controller = Get.put(SettingController());
    final Requestcontroller = Get.put(req);


    return Scaffold(
        appBar: appBer,
        body: Container(
          height: hightScreen,
          padding: const EdgeInsets.all(5),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Flexible(
                flex: 5,
                child: Container(
                    height: hightScreen * 0.82, child: StepperComponent()),
              ),
            ],
          ),
        ));
  }
}
