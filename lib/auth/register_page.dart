

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../view_model/register_view_model.dart';
import '../widget/custom_text.dart';
class RegisterPage extends GetWidget<RegisterViewModel> {
  const RegisterPage({super.key});


  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(RegisterViewModel());

    return SafeArea(
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
                child: TabBar(
                  controller: controller.tabController,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                 indicatorSize: TabBarIndicatorSize.label,
                  tabs: const [
                    Tab(
                      child:
                       CustomText(text: 'Carwash',alignment: Alignment.center),
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
                  controller: controller.tabController,
                  children:  [
                    // RegisterPageCarwash(),
                    // RegisterPageCustomer(),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
