import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../helper/constant.dart';
import '../../../view_model/HandlingSpeech/ISpeechTotext.dart';
import '../../../view_model/RequestController.dart';
import '../../Companies.dart';
import 'DataRequest_component.dart';
import 'OrderDelivery.dart';
import 'OrderTransport.dart';

class StepperComponent extends StatefulWidget {
  const StepperComponent({super.key});

  @override
  State<StepperComponent> createState() => _StepperStepperComponent();
}

class _StepperStepperComponent extends State<StepperComponent> {

  int currentStep = 0;

  String dropdownvalue = 'Choose one car';
  var items = [
    'Profile',
    'Settings',
    'Account',
    'Go Premium',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    RequestController req=RequestController();

    final controller = Get.put(req);
   print( controller.comp_typ);
    List<Step> getsteps() => [
          Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: const Text('Company'),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child:Companies(),
            ),
          ),
          Step(
            isActive: currentStep >= 1,
            title: const Text('Order'),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child:controller.comp_typ==1? OrderDelivery():OrderTransport(),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                ],
              ),
            ),
          ),

        ];
    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: kTextLigthColor)),
      child: Stepper(
        type: StepperType.horizontal,
        steps: getsteps(),
        currentStep: currentStep,
        onStepContinue: () {
          final isLastSteps = currentStep == getsteps().length - 1;
          if (isLastSteps){
            controller.handlingRequest();
            print('complete');
          }
          //here you send data to database
          else {
            setState(() {
              currentStep += 1;
            });
          }
        },
        onStepTapped: (value) => setState(() {
          currentStep = value;
        }),
        onStepCancel: () {
          currentStep == 0
              ? null
              : setState(() {
                  currentStep -= 1;
                });
        },
        controlsBuilder: (context, ControlsDetails) {
          final isLastSteps = currentStep == getsteps().length - 1;
          return Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: ControlsDetails.onStepContinue,
                    child: Text(isLastSteps ? 'Confirm ' : 'Next '),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                if (currentStep != 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ControlsDetails.onStepCancel,
                      child: const Text('Cencel '),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
