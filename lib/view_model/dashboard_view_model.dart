import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DashboardController extends GetxController  {
  var currentIndex = 0;

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
}