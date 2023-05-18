import 'package:get/get.dart';

import '../Services/FirebaseAuth.dart';
import '../model/Binding/CompanyModel.dart';

class RequestController extends GetxController{

  @override
  void onInit() {

  }
  Future<UserModel?> GetCompanybyid(String Userid){

    return Firebase_Auth().GetcompanyById(Userid);

  }

}