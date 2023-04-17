import 'package:foryourservice/view_model/login_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NameOfClass extends  GetxController{


     String get LoginModel => 'LoginViewModel';
     // String get LoginwModels => LoginViewModel;
      LoginViewModel get Login => Get.find<LoginViewModel>();

}
