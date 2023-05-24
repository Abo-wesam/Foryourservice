import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/Binding/CarSteperModel.dart';
import '../../../view_model/HandlingSpeech/ISpeechTotext.dart';
import '../../../view_model/RequestController.dart';
import '../../../widget/custom_text_form_field.dart';

class OrderTransport extends StatefulWidget {
  const OrderTransport({super.key});

  @override
  State<OrderTransport> createState() => _OrderTransportState();
}

class _OrderTransportState extends State<OrderTransport> {


  @override
  Widget build(BuildContext context) {
    RequestController req=RequestController();
    final controller = Get.put(req);
    return Scaffold(
      body: Container(
        child:
               Column(
                 children: [
                   SizedBox(
                     // height: 100,
                     // width: double.infinity,
                     child: ListView.builder(
                         // physics: NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                              itemCount: listCarSteper.length,
                              itemBuilder: (context, index) {
                                return InkWell(

                                  // decoration: BoxDecoration(
                                  //     border: Border.all(
                                  //         width: 1.3,
                                  //         color: Colors.blue,
                                  //         style: BorderStyle.solid),
                                  //     color: Colors.grey.shade100,
                                  //     borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.3, color: Colors.blue, style: BorderStyle.solid),
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 6.0),
                                                child: Image.asset(
                                                  listCarSteper[index].name_image,
                                                  width: 40,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                listCarSteper[index].name_CarSteper,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.red.shade600,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              Radio(
                                                  value: listCarSteper[index].value,
                                                  groupValue: listCarSteper[index].groupValue,
                                                  onChanged: (value) {
                                                    Colors.green;
                                                   var typeCar;
                                                   typeCar == value;
                                                    print(value); //selected value
                                                  })
                                            ],
                                          ),

                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              }),
                   ),
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




            // SizedBox(height: 40,),
            // Center(
            //   child: Row(
            //     children: [
            //       Text('Destination :', style: TextStyle(color: Colors.blue)),
            //       Expanded(
            //         child: Container(
            //           // margin: const EdgeInsets.symmetric(horizontal: 20),
            //           child: CustomTextFromField(
            //             lable: 'Destination',
            //             hint: 'Enter Destination',
            //             controller: controller.TargetDestination,
            //
            //             // validator: (text) => registrcontroller.erroremail(text!),
            //             // registrcontroller.erroremail(text!),
            //           ),
            //         ),
            //       ),
            //       IconButton(
            //         onPressed: () {},
            //         icon: Icon(
            //           Icons.add_location,
            //           color: Colors.lightBlue,
            //         ),
            //       )
            //     ],
            //   ),
            // ),

            // Row(
            //   children: [
            //     Text(
            //       'Your Address :',
            //       style: TextStyle(color: Colors.blue),
            //     ),
            //     Expanded(
            //       child: Container(
            //         // margin: const EdgeInsets.symmetric(horizontal: 20),
            //         child: CustomTextFromField(
            //           lable: 'Address',
            //           hint: 'Enter Your Address',
            //           controller: controller.CurrantDestination,
            //
            //           // validator: (text) => registrcontroller.erroremail(text!),
            //           // registrcontroller.erroremail(text!),
            //         ),
            //       ),
            //     ),
            //     IconButton(
            //       onPressed: () {},
            //       icon: Icon(
            //         Icons.add_location,
            //         color: Colors.lightBlue,
            //       ),
            //     )
            //   ],
            // )


      ),
    );
  }
}
