import 'package:foryourservice/views/sitting%20company/add_driver.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../RecordPage.dart';
import '../../TestPage.dart';
import '../../auth/Admin/MainAdmin.dart';
import '../../auth/Dashboard/dashboard.dart';
import '../../auth/login_page.dart';
import '../../auth/register_page.dart';

import '../../views/Adminscreen/EditCompany.dart';
import '../../views/Companies.dart';
import '../../views/Profile.dart';
import '../../views/Requests/Request_View.dart';
import '../../views/Requests/Requestscomponent/DataRequest_component.dart';
import '../../views/Requests/Requestscomponent/OrderDelivery.dart';
import '../../views/Requests/Requestscomponent/OrderTransport.dart';
import '../../views/Requests/Requestscomponent/PlaceMarkerPage.dart';
import '../../views/Schedule/Schedule.dart';
import '../../views/onboarding/Getstarted.dart';
import 'Binding.dart';

class Routes {
  Routes._();
  static String HomePageScreens = '/HomePageScreen';
  static String Login = '/LoginPage';
  static String Register = '/RegisterPage';
  static String Dashboard = '/dashboard';
  static String MainAdmin = '/MainAdmin';
  static String Addroles = '/Addrole';
  static String EditCompanys = '/EditCompany';
  static String Getstartedpage = '/Getstartedpage';
  static String profile = '/Profile';
  static String Companiesscreen = '/Companies';
  static String Request = '/RequestPage';
  static String Location = '/Location';
  static String OrderTransports = '/OrderTransport';
  static String Orderdeliver = '/OrderDelivery';
  static String Test = '/MyPage';
  static String Schedules='/';
    static String Drivers='/AddDriver';

  static List<GetPage> routes = [
    GetPage(
      name: Routes.Login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.Register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: Routes.HomePageScreens,
      page: () => HomePageScreen(),
    ),
    GetPage(
      name: Routes.Dashboard,
      page: () => dashboard(),
    ),
    GetPage(
      name: Routes.MainAdmin,
      page: () => MainScreen(),
    ),
    GetPage(
      name: Routes.EditCompanys,
      page: () => EditCompany(),
    ),
    GetPage(
      name: Routes.Getstartedpage,
      page: () => Getstarted(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => Profile(),
    ),
    GetPage(
      name: Routes.Companiesscreen,
      page: () => Companies(),
    ),
    GetPage(
      name: Routes.Request,
      page: () => RequestPage(),
    ),
    GetPage(
      name: Routes.Location,
      page: () => PlaceMarkerBody(),
    ),GetPage(
      name: Routes.OrderTransports,
      page: () => OrderTransport(),
    ),
    GetPage(
      name: Routes.Orderdeliver,
      page: () => OrderDelivery(),
    ),
    GetPage(
      name: Routes.Test,
      page: () => MyPage(),
    ),
    GetPage(
      name: Routes.Schedules,
      page: () => Schedule(),
    ),
  GetPage(
      name: Routes.Drivers,
      page: () => AddDriver(),
    ),
  ];
}

/// Add this list variable into your GetMaterialApp as the value of getPages parameter.
/// You can get the reference to the above GetMaterialApp code.
