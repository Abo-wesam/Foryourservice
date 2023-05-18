import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../helper/constant.dart';
import 'DataRequest_component.dart';

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
    List<Step> getsteps() => [
          Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: const Text('Your Location'),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child:Text('get location'),
            ),
          ),
          Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text('Request Data'),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Text('about you page'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color:
                            Colors.white, //background color of dropdown button
                        border: Border.all(
                            color: kTextLigthColor,
                            width: 3), //border of dropdown button
                        borderRadius: BorderRadius.circular(
                            10), //border raiuds of dropdown button
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: DropdownButton(
                          hint: Text(dropdownvalue),
                          underline: Container(),
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: const TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Step(
            isActive: currentStep >= 2,
            title: const Text('Time'),
            content: Container(
              height: MediaQuery.of(context).size.height,
              child: Text('about you page'),
            ),
          )
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
          if (isLastSteps)
            print('complete'); //here you send data to database
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
