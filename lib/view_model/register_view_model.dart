import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Services/FirebaseAuth.dart';
import '../model/Binding/CompanyModel.dart';
import '../model/Binding/CustomerModel.dart';

class RegisterViewModel extends GetxController with SingleGetTickerProviderMixin {
  late  FirebaseAuth _auth  ;
  //FirebaseAuth _auth=FirebaseAuth.instance;
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late   TextEditingController passwordConfirmController = TextEditingController();
  late TextEditingController AddressdController = TextEditingController();
  late TextEditingController DescrptionController = TextEditingController();
  late TextEditingController PhotoController = TextEditingController();
  late TextEditingController TYpeCompanyController = TextEditingController();
late String id, FullName, email, password, confirmPassword;
  String? emailError, passwordError,nameError;
  // final bike = ''.obs;
   @override
     void onInit() {
      // tabController = TabController(vsync: this, length: 2);
      // bike.value='customer view model';
     nameController.value.text.isEmpty;
     emailController.value.text.isEmpty;
     passwordController.value.text.isEmpty;
     passwordConfirmController.value.text.isEmpty;
     AddressdController.value.text.isEmpty;
     PhotoController.value.text.isEmpty;
    super.onInit();
  }

  String?   erroremail(String v){
    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (v!.isEmpty || !emailExp.hasMatch(v)) {
    return "Email is invalid";
     }

     return  null;
  }
  String?   errorpass(String v){
    if (v.isEmpty ) {
      return  "Please enter a password";
    }

    return null;
  }
  // String? get  errorpassmatch{
  //   if (passwordController.value.text != passwordConfirmController.value.text) {
  //     return "Passwords do not match";
  //   }
  //
  //   return null;
  // }

String? errorpassmatch(String v){

     print(passwordConfirmController.value.text);

    if (passwordController.value.text != passwordConfirmController.value.text) {
      return "Passwords do not match";
    }

    return null ;
  }
  String? errorName(String v){
     if(v.length<10||v.split(' ').length<3){
       return 'The entered name must not be less than three names';
     }
//      final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
// if(nameRegExp.hasMatch(v)){
//   return "Enter Correct Name";
// }
     return null ;
  }

  void resetErrorText() {
    emailError = '';
    passwordError = '';
    update();
  }
  bool validateRegister() {
    resetErrorText();

    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValid = true;
    if (emailController.value.text.isEmpty || !emailExp.hasMatch(emailController.value.text)) {
      emailError = "Email is invalid";

      isValid = false;
    }

    if (passwordController.value.text.isEmpty || passwordConfirmController.value.text.isEmpty) {
      passwordError = "Please enter a password";

      isValid = false;
    }
    if (passwordController.value.text != passwordConfirmController.value.text) {
      passwordError = "Passwords do not match";

      isValid = false;
    }
    if(nameController.text.isEmpty){
      nameError='Enter your full name ';
      isValid=false;
      print(isValid);
    }

    return isValid;
  }
 Future<void>  submitRegister(String typeOfRegist,BuildContext context) async{
   _auth = FirebaseAuth.instance;
     print(PhotoController.text);
     if(typeOfRegist=='Company'){

       var companymodel=CompanyModel(Name: nameController.value.text,Email: emailController.value.text,
         Address: AddressdController.value.text,
         Password: passwordController.value.text,
         comp_Type: 1,
         is_active: false,
         Descrption: DescrptionController.value.text,
         Photo:PhotoController.text,
         Created_ON: DateTime.now(),
       );
       Firebase_Auth(_auth).signUpWithEmail(companymodel,context,typeOfRegist );
     }
     else{

       var custmodel=CustomerModel(
         Name: nameController.value.text,
         Email: emailController.value.text,
         Address: AddressdController.value.text,
         Password: passwordController.value.text,
         Photo:PhotoController.value.text,
         Created_ON: DateTime.now(),
       );
       Firebase_Auth(_auth).signUpWithEmail(custmodel,context,typeOfRegist );

     }
   nameController.value.text.isEmpty;

  }
  Future uploadFile() async{


  }


}

