import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../helper/constant.dart';
import '../../model/Binding/CompanyModel.dart';
import '../../view_model/RequestController.dart';
import '../../view_model/SettingController.dart';
import 'Requestscomponent/StepperComponent.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String?> args = Get.arguments;
    print(args['compid']);

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
    final Requestcontroller = Get.put(RequestController());


    return Scaffold(
        appBar: appBer,
        body: Container(
          height: hightScreen,
          padding: const EdgeInsets.all(5),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: hightScreen * 0.15,
                child:
                FutureBuilder<UserModel?>(
                    future: Requestcontroller.GetCompanybyid(args['compid']!),
                    builder: (
                        context,
                        snapshot,
                        ) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // show a loading indicator while waiting for the data
                      } else if (snapshot.hasError) {
                        return Text(
                            'Error: ${snapshot.error}'); // show an error message if the asynchronous operation failed
                      } else {
                       UserModel users = snapshot.data!;
                    
                        return Container(
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    border: Border.all(color: kTextLigthColor),
                                    borderRadius: BorderRadius.circular(5),
                                    // image:  DecorationImage(
                                    //     scale: 0.5,
                                    //     image:  Image.network( '${users.Photo}' ))
                                ),
                                child:Image.network( '${users.Photo}' ) ,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    users.Name
                                    ,
                                    style: TextStyle(
                                        color: kTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Address : ${users.Address}',
                                    style:
                                    TextStyle(color: kTextLigthColor, fontSize: 10),
                                  ),
                                  Text(
                                    'Descrption : ${users.Descrption}',

                                    style:
                                    TextStyle(color: kTextLigthColor, fontSize: 10),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: 3,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.star_purple500_outlined,
                                    color: Colors.orangeAccent,
                                    size: 18,
                                  ),
                                  Text(
                                    '6.4 Km',
                                    style: TextStyle(color: Colors.grey, fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        );
                      }})
              ),
              // const Divider(
              //   thickness: 3,
              //   color: Colors.grey,
              //   indent: 20,
              //   endIndent: 20,
              // ),
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
