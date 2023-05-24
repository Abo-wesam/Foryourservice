import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/SharedStorage.dart';
import 'helper/firebase_options.dart';
import 'model/Binding/Binding.dart';
import 'model/Binding/Routes.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

 // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
// print(DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp(
    options:
    const FirebaseOptions(
      apiKey: "AIzaSyCFO06XPEjgL1nJvrBp35QmD5cNRNnWp4Q",
      appId: "1:679604109335:android:fde4328fe35c3c63df9c52",
      messagingSenderId: "679604109335",
      projectId: "foryourserviceapp", ),
  );
  runApp(
      defaultTargetPlatform==TargetPlatform.android? const MyApp():
      DevicePreview(
        // enabled: !kReleaseMode,
        //  enabled: !kDebugMode,

        builder: (context) => const MyApp(),
      ),
    // const MyApp(),

  );
    // const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

  return StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {

      if (snapshot.connectionState == ConnectionState.active) {
        User? user = snapshot.data;
        if (user == null) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            title: 'Rafiq App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialBinding: Binding(),
            initialRoute: Routes.Login,
            getPages: Routes.routes,

            // home:  LoginPage(),
          );
        } else {

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            title: 'Rafiq App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialBinding: Binding(),

            initialRoute: Routes.Dashboard,
            getPages: Routes.routes,

            // home:  LoginPage(),
          );
        }
      } else {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      }
    },
  );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Rafiq App',
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

