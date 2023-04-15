
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/lifecycle.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RegisterViewModel extends GetxController with SingleGetTickerProviderMixin {
  //FirebaseAuth _auth=FirebaseAuth.instance;


  late TabController tabController=TabController(vsync: this, length: 2);
late String id, FullName, email, password, confirmPassword;
  String? emailError, passwordError,name;
  final bike = ''.obs;
   @override
     void onInit() {
      tabController = TabController(vsync: this, length: 2);
      bike.value='customer view model';
    email = "";
    password = "";
    confirmPassword = "";
    emailError = null;
    passwordError = null;
      name="";
    super.onInit();
  }

  void resetErrorText() {
    emailError = null;
    passwordError = null;
    update();
  }
  bool validateRegister() {
    resetErrorText();

    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValid = true;
    if (email.isEmpty || !emailExp.hasMatch(email)) {
      emailError = "Email is invalid";

      isValid = false;
    }

    if (password.isEmpty || confirmPassword.isEmpty) {
      passwordError = "Please enter a password";

      isValid = false;
    }
    if (password != confirmPassword) {
      passwordError = "Passwords do not match";

      isValid = false;
    }
    if(FullName.isEmpty){
      name='Enter your full name ';
      isValid=false;
      print(isValid);
    }

    return isValid;
  }
   void submitRegister() async{
  //    print('data');
  //   try {
  //
  //     if(validateRegister()){
  //       final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: email,
  //         password: password,
  //       );
  //
  //       final user = credential.user;
  //       print(user);
  //       if(user!=null){
  //         CustomerModel customerModel=CustomerModel(id: user.uid,FullName: FullName,Password:password,email:email);
  //
  //         if(await Registerservies().CreateNewUser(customerModel)){
  //           Get.snackbar('Register','Register successfull');
  //           Get.to(LoginPage());
  //         }
  //       }
  //     }
  //
  //
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       Get.snackbar('Register','The password provided is too weak.');
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       Get.snackbar('Register','The account already exists for that email.');
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  }

  @override
  void $configureLifeCycle() {
    // TODO: implement $configureLifeCycle
  }

  @override
  // TODO: implement initialized
  bool get initialized => throw UnimplementedError();

  @override
  // TODO: implement isClosed
  bool get isClosed => throw UnimplementedError();

  @override
  void onClose() {
    // TODO: implement onClose
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => throw UnimplementedError();

  @override
  void onReady() {
    // TODO: implement onReady
  }

  @override
  // TODO: implement onStart
  InternalFinalCallback<void> get onStart => throw UnimplementedError();

}

