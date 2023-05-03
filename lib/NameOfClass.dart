import 'package:foryourservice/view_model/login_view_model.dart';
import 'package:get/get.dart';


class NameOfClass extends  GetxController{


     String get LoginModel => 'LoginViewModel';
     // String get LoginwModels => LoginViewModel;
      LoginViewModel get Login => Get.find<LoginViewModel>();

}
