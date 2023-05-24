import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/FirebaseAuth.dart';
import '../helper/constant.dart';
import '../model/Binding/CarSteperModel.dart';
import '../model/Binding/CompanyModel.dart';
import '../model/Binding/RequestModel.dart';
import '../utils/showSnackbar.dart';
import 'HandlingSpeech/ISpeechTotext.dart';
import 'HandlingSpeech/SpeechTotextController.dart';
import 'SettingController.dart';

class RequestController extends GetxController {
  late SharedPreferences preferences = SharedPreferences.getInstance() as SharedPreferences;
  final Spechtext = Get.put(SpeechTotextController());
  final companies = Get.put(SettingController());
  bool? isDisablde=false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late int comp_typ;
  late String  typeCar;
  late String  screentype;
  late TextEditingController CurrantDestination = TextEditingController();
  late TextEditingController TargetDestination = TextEditingController();
  late TextEditingController targetPlace = TextEditingController();
  late TextEditingController DescriptionOrder = TextEditingController();
  late TextEditingController compid = TextEditingController();

  @override
  void onInit() {
    comp_typ = 0;
    screentype='home';
    initializePreferences();
     handlingSpech();



    // _Spech?.handlinHomeSpoking(DataOfService);
  }
  Future<void> initializePreferences() async {
    preferences = await SharedPreferences.getInstance();
    update();
  }

  Future<UserModel?> GetCompanybyid(String Userid) {
    return Firebase_Auth().GetcompanyById(Userid);
  }

  handlingRequest() {
    print('handling request');
    print(compid.text);

    String getdat = DateTime.now().toString();
    CarSteper getcar = listCarSteper.map((e) => e.value = typeCar) as CarSteper;
    final user_id = _auth.currentUser?.uid;
    final Name_User=_auth.currentUser?.displayName;
    final requestmodel = Request_Model(
      typeComp: comp_typ,
      typeCar: getcar,
      User_id: user_id,
      NameUser: Name_User,
      TargetDestination: TargetDestination.text,
      CurruntDestination: CurrantDestination.text,
      Target_place: targetPlace.text,
      Description: DescriptionOrder.text,
      Status_req: 1,
      comp_id: compid.text,
      Created_ON: getdat,
    );

    Firebase_Auth().CreatNewRequest(requestmodel);
  }

  handlingSpech() async {
    print(  preferences.getBool('isDisablde'));
 isDisablde= preferences.getBool('isDisablde');
    if ( screentype=='home'&&isDisablde==true) {
      Spechtext.speakListHome(DataOfService);
    }
  }
}
