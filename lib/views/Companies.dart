import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foryourservice/model/Binding/CompanyModel.dart';
import 'package:get/get.dart';
import '../Services/FirebaseAuth.dart';
import '../helper/constant.dart';
import '../model/Binding/Routes.dart';
import '../view_model/HandlingSpeech/ISpeechTotext.dart';
import '../view_model/RequestController.dart';
import '../view_model/SettingController.dart';
import '../widget/form_button.dart';

// class Companies extends StatefulWidget {
//   const Companies({super.key, required item});
//   @override
//   State<Companies> createState() => _CompaniesState();
// }

class Companies extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // final Map<String, int> args = Get.arguments;
    final controller = Get.put(SettingController());
    final recostcomp = Get.put(RequestController());
    // print(args['index']);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FutureBuilder<List<UserModel>>(
          future: controller.GetAllCompany(recostcomp.comp_typ),//getcompany by comptype
          builder: (
            context,
            snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // show a loading indicator while waiting for the data
            } else if (snapshot.hasError) {
              return Text(
                  'Error: ${snapshot.error}'); // show an error message if the asynchronous operation failed
            } else {
              List<UserModel> users = snapshot.data!;
              return GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.length,
                gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3/2 ,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15

                ),
                itemBuilder: (context, index) {
                  final user = snapshot.data![index];

                  return Container(
                    decoration: BoxDecoration(
                      color: kBgTempletColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        recostcomp.compid.text=user.User_id!;
                        print(user.User_id!);

                      },
                      child: ListView(
                        scrollDirection:Axis.horizontal ,
                        children: [Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.blueGrey,
                                        style: BorderStyle.solid),
                                    color: kBgTempletColor,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Image.asset('assets/images/Profile.png'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    '${user.Name.split(' ')[0].trim()+' '+user.Name.split(' ')[1].trim()}',
                                    softWrap: true,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      height: 1.8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                              //     Text(
                              // '${user.Name.split(' ')[0].trim()+' '+user.Name.split(' ')[1].trim()}',
                              //       style: const TextStyle(color: kTextColor, fontSize: 16),
                              //     ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Address: ${user.Address.trimLeft()}',
                                    style:

                                    const TextStyle(color: kTextLigthColor, fontSize: 10),

                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                      'Des:${user.Descrption}',
                                      style:

                                      const TextStyle(color: kTextLigthColor, fontSize: 10),

                                    ),

                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [



                                  ])
                                ],
                              ),
                            ],
                          ),

                        ),
                   ]   )
                    )

                  );
                },
              );
            }
          }

          // },
          // separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
          ),
    )
        // )
        );
  }

  void clickbut() {
    print("Container clicked");
  }

  void _handleTap(String? compid) {
    Get.toNamed(Routes.Request, arguments: {'compid': compid});
  }
}
