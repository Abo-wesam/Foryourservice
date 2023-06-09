

import 'package:get/get.dart';
import '../../view_model/HandlingSpeech/ISpeechTotext.dart';
import '../../view_model/RequestController.dart';
import '../../view_model/SettingController.dart';
import '../../view_model/SpeechController.dart';
import '../../view_model/HandlingSpeech/SpeechTotextController.dart';
import '../../view_model/dashboard_view_model.dart';
import '../../view_model/login_view_model.dart';
import '../../view_model/register_view_model.dart';

class Binding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
    Get.lazyPut<SpeechController>(() => SpeechController());
    Get.lazyPut<RegisterViewModel>(() => RegisterViewModel());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<SettingController>(() => SettingController());
    Get.lazyPut<RequestController>(() => RequestController());
    Get.lazyPut<SpeechTotextController>(() => SpeechTotextController());

  }
}


