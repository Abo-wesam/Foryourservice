

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../view_model/register_view_model.dart';
import '../views/RegisterPageCompany.dart';
import '../views/RegisterPageCustomer.dart';
import '../widget/custom_text.dart';
class RegisterPage extends GetWidget<RegisterViewModel> {

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(RegisterViewModel());

    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            // leading: Goback(),
            title: const Text("Register"),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 10,
              right: 10,
            ),
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    
                  ),
                  child: const TabBar(
                    // controller: controller.tabController,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                   indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(
                        child:
                         CustomText(text: 'Company',alignment: Alignment.center),
                      ),
                      Tab(
                       child:
                         CustomText(text: 'Customer',alignment: Alignment.center),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    // controller: controller.tabController,
                    children:  [
                     RegisterCompany(),
                     RegisterCustomer(),


                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
