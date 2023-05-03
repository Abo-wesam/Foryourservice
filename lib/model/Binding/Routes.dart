
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../RecordPage.dart';
import '../../auth/Dashboard/dashboard.dart';
import '../../auth/login_page.dart';
import '../../auth/register_page.dart';

import 'Binding.dart';


class Routes {

  Routes._();
  static String HomePageScreens = '/HomePageScreen';
  static String Login = '/';
  static String Register = '/RegisterPage';
  static String Dashboard = '/dashboard';






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
    GetPage(
    name: Routes.HomePageScreens,
    page: () =>  HomePageScreen(),
  ),
    GetPage(
    name: Routes.Dashboard,
    page: () =>  dashboard(),
  ),

  ];





}

  /// Add this list variable into your GetMaterialApp as the value of getPages parameter.
  /// You can get the reference to the above GetMaterialApp code.
