
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../RecordPage.dart';
import '../../auth/Admin/MainAdmin.dart';
import '../../auth/Dashboard/dashboard.dart';
import '../../auth/login_page.dart';
import '../../auth/register_page.dart';

import '../../views/Adminscreen/EditCompany.dart';
import '../../views/Profile.dart';
import '../../views/onboarding/Getstarted.dart';
import 'Binding.dart';


class Routes {

  Routes._();
  static String HomePageScreens = '/HomePageScreen';
  static String Login = '/Login';
  static String Register = '/RegisterPage';
  static String Dashboard = '/dashboard';
  static String MainAdmin = '/MainAdmin';
  static String Addroles = '/Addrole';
  static String EditCompanys = '/EditCompany';
  static String Getstartedpage = '/Getstartedpage';
  static String profile = '/';






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
  ),GetPage(
    name: Routes.MainAdmin,
    page: () =>  MainScreen(),
  ),

    GetPage(
      name: Routes.EditCompanys,
      page: () =>  EditCompany(),
    ),
    GetPage(
      name: Routes.Getstartedpage,
      page: () =>  Getstarted(),
    ),GetPage(
      name: Routes.profile,
      page: () =>  Profile(),
    ),

  ];





}

  /// Add this list variable into your GetMaterialApp as the value of getPages parameter.
  /// You can get the reference to the above GetMaterialApp code.
