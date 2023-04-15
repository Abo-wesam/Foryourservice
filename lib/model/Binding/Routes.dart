
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../auth/login_page.dart';
import '../../auth/register_page.dart';

import 'Binding.dart';


class Routes {

  Routes._();
  static String Login = '/';
  static String Register = '/RegisterPage';





  static List<GetPage> routes =
  [
    GetPage(
      name: Routes.Login,
      page: () => LoginPage(),
      
    ),

    GetPage(
      name: Routes.Register,
      page: () =>  RegisterPage(),
    ),

  ];





}

  /// Add this list variable into your GetMaterialApp as the value of getPages parameter.
  /// You can get the reference to the above GetMaterialApp code.
