import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Home.dart';
import 'auth/login_page.dart';
import 'model/Binding/Binding.dart';
import 'model/Binding/Routes.dart';
import 'package:get_it/get_it.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
   
     DevicePreview(
      // enabled: !kReleaseMode,
      // enabled: !kDebugMode,

      builder: (context) => const MyApp(),
    ),
  );
    // const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: Binding(),
      initialRoute: Routes.Login,
   
      getPages: Routes.routes,

      // home:  LoginPage(),
    );
  }
}

