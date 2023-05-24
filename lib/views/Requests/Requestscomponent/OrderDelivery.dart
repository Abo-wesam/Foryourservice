import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/Binding/CarSteperModel.dart';
import '../../../view_model/HandlingSpeech/ISpeechTotext.dart';
import '../../../view_model/RequestController.dart';
import '../../../widget/custom_text_form_field.dart';

class OrderDelivery extends StatefulWidget {
  const OrderDelivery({super.key});

  @override
  State<OrderDelivery> createState() => _OrderDeliveryState();
}

class _OrderDeliveryState extends State<OrderDelivery> {


  @override
  Widget build(BuildContext context) {

    final controller = Get.put(RequestController());
    return Scaffold(
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 20,),
                  SizedBox(
                    child: Container(
                        child: Row(
                      children: [
                        Text('Target Place', style: TextStyle(color: Colors.blue)),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextFromField(
                              lable: 'Target Place',
                              hint: 'Enter Target Place',
                              controller: controller.targetPlace,
                              icon: Icon(Icons.restaurant),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Description', style: TextStyle(color: Colors.blue)),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextFromField(
                            lable: 'Description Order',
                            hint: 'Enter Description',
                            controller: controller.DescriptionOrder,

                            icon: Icon(Icons.description),
                            // validator: (text) => registrcontroller.erroremail(text!),
                            // registrcontroller.erroremail(text!),
                          ),
                        ),
                      ),
                    ],
                  )),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(left:2.5),
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(4),
                      border: Border.all(
                          width: 2,
                          color: Colors.blueAccent,
                          style: BorderStyle.solid
                      ),
                      // shape: BoxShape.rectangle,


                    ),

                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('Destination :', style: TextStyle(color: Colors.blue)),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: CustomTextFromField(
                                    lable: 'Destination',
                                    hint: 'Enter Destination',
                                    controller: controller.TargetDestination,

                                    // validator: (text) => registrcontroller.erroremail(text!),
                                    // registrcontroller.erroremail(text!),
                                  ),
                                ),
                              ),
                              IconButton(onPressed: (){},icon: Icon(Icons.add_location,color: Colors.lightBlue,),)
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Text(
                                'Your Address :',
                                style: TextStyle(color: Colors.blue),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: CustomTextFromField(
                                    lable: 'Address',
                                    hint: 'Enter Your Address',
                                    controller: controller.CurrantDestination,

                                    // validator: (text) => registrcontroller.erroremail(text!),
                                    // registrcontroller.erroremail(text!),
                                  ),
                                ),
                              ),
                              IconButton(onPressed: (){},icon: Icon(Icons.add_location,color: Colors.lightBlue,),)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
        ),

    );
  }
}
