import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foryourservice/model/Binding/CompanyModel.dart';

import 'package:get/get.dart';

import '../Services/FirebaseAuth.dart';
import '../auth/login_page.dart';
import '../model/Binding/Roles.dart';

class DashboardController extends GetxController  {
  var currentIndex = 0;
  FirebaseAuth _auth = FirebaseAuth.instance;
  late TextEditingController roleController = TextEditingController();
  late TextEditingController descrController = TextEditingController();
  late TextEditingController screenController = TextEditingController();
  var tabindex=0;
  void changselectedtab(int index){
    tabindex=index;
    update();

  }
  @override
  void onInit() {
    super.onInit();
  }
  void setBottomBarIndex(int index) {
    currentIndex = index;
    update();
  }

 //
Future<List<UserModel>> GetCompany() async {

    final result =await Firebase_Auth().GetUser();
    result.forEach((element) {


    });
    return await Firebase_Auth().GetUser();
  }

  void updateCompany(String? id, bool is_active) {
    Firebase_Auth().ApproveCompany(id,is_active);
  }

  void gotoLoginpagr() {
    Get.to(() => LoginPage());
  }


}