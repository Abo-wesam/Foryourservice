import 'package:flutter/material.dart';
import 'package:foryourservice/model/Binding/DriversModel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Services/FirebaseAuth.dart';
import '../model/Binding/CompanyModel.dart';
import 'HandlingSpeech/SpeechTotextController.dart';

class SettingController extends GetxController {
  late List<UserModel> listcomp;
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController passwordConfirmController =
      TextEditingController();
  late TextEditingController AddressdController = TextEditingController();
  late TextEditingController DescrptionController = TextEditingController();
  late TextEditingController PhotoController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController CompanyType = TextEditingController();
  late TextEditingController TYpeUSerController = TextEditingController();
  final Spechtext = Get.put(SpeechTotextController());
  void onInit() {
    // tabController = TabController(vsync: this, length: 2);
    // bike.value='customer view model';
    nameController.value.text.isEmpty;
    emailController.value.text == '';
    passwordController.value.text.isEmpty;
    passwordConfirmController.value.text.isEmpty;
    AddressdController.value.text.isEmpty;
    PhotoController.value.text.isEmpty;
    super.onInit();
  }

  Future<List<UserModel>> GetAllCompany(int comp_typ) async {
    // List<UserModel> listcomp;
    Future<List<UserModel>> futureList =
        Firebase_Auth().GetAllCompany(comp_typ);
    listcomp = await futureList;
    print('the list company ${listcomp.length}');
    Spechtext.speakListcompanylist(listcomp);
    return await Firebase_Auth().GetAllCompany(comp_typ);
  }

  Future <List<driverModel>> Getdrivers() async {
    return await Firebase_Auth().GetAllDrivers();

  }

  Future<void> updatedriver(driverModel driver) async{
        Firebase_Auth().UpdateDrivers(driver);
  }
  Future<void> deletedriver(String driver) async{
        Firebase_Auth().DeleteDrivers(driver);
  }
}
