import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foryourservice/auth/login_page.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import '../auth/Admin/MainAdmin.dart';
import '../auth/Dashboard/dashboard.dart';
import '../model/Binding/CompanyModel.dart';
import '../model/Binding/Roles.dart';
import '../model/Binding/Routes.dart';
import '../utils/showSnackbar.dart';

class Firebase_Auth with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('User');
  final CollectionReference _referenceroledet =
      FirebaseFirestore.instance.collection('RoleDetals');

  UserModel? _user;
  UserModel get user=>_user!;

  Future<void> signUpWithEmail(
      UserModel model, BuildContext context, String typeOfRegist) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: model.Email,
        password: model.Password,
      );
      final getid = credential.user!;

      print('id: ${credential}');
      CreateUser(model, getid.uid, context);
    } on FirebaseAuthException catch (e) {
      // if you want to display your own custom error message
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      showSnackBar(
          context, e.message!); // Displaying the usual firebase error message
    }
  }



  Future<void> Login(String email, String Password) async {

    try {
      _auth.signInWithEmailAndPassword(email: email, password: Password);
   final userauth=_auth.currentUser;
   if(userauth != null){
     _collectionReference.where('User_id',isEqualTo: _auth.currentUser?.uid)
         .get().then((snapshot){
           if(snapshot.docs.isNotEmpty){
           final GetUser=  snapshot.docs.map((e) =>  UserModel.fromsnapshot(e as DocumentSnapshot<Map<String, dynamic>>))
                 .toList();
           GetUser.forEach((element) {
             _user=element;
             if(element.is_active==true){
               if(element.Role=='Customer'){
                 Get.to(dashboard());
                 Get.snackbar('Login', 'Login successfull');

               }
               if(element.Role=='Company'){
                 print(user.Role);
                 Get.to(dashboard());
                 Get.snackbar('Login', 'Login successfull');
               }
             }else{
               Get.snackbar(
                           'Login', 'Check your e-mail or adminstration to verify access');
                         _auth.signOut();
                       Get.to(LoginPage());
             }


           });

           }else{

             navigator?.pushNamed(Routes.MainAdmin);
               Get.snackbar('Login', 'Login successfull');


           }

     });

   }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Login', 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Login', 'Wrong password provided for that user.');
      }
      Get.snackbar('Login', e.message!);
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Display error message
    }
  }

String? getRoles()  {

  String? Role;
    _collectionReference.where('User_id',isEqualTo: _auth.currentUser?.uid)
        .get().then((snapshot) {
     if(snapshot.docs.isNotEmpty) {
       final GetUser = snapshot.docs.map((e) =>
           UserModel.fromsnapshot(e as DocumentSnapshot<Map<String, dynamic>>))
           .toList();
       GetUser.forEach((element) {
         Role = element.Role;
       });
     }

   });

    return Role;
  }

  Future<List<UserModel>> GetUser() async {
    List<UserModel> response = [];

        _collectionReference.where('User_id',isEqualTo: _auth.currentUser?.uid)
            .get().then((snapshot) {
      if(snapshot.docs.isNotEmpty) {
         response = snapshot.docs.map((e) =>
            UserModel.fromsnapshot(e as DocumentSnapshot<Map<String, dynamic>>))
            .toList();}});
    return response;
  }

  CreateUser(UserModel model, String id, BuildContext context) async {
    try {
      model.User_id = id;
      await _collectionReference.doc(model.User_id).set(model.tojson());
      if (model?.type_user == 1) {
        model.Role='Customer';
        await _collectionReference.doc(model.User_id).set(model.tojson());

      }
      if (model?.type_user == 2) {
        model.Role='Company';
        await _collectionReference.doc(model.User_id).set(model.tojson());
        Get.snackbar(
            'Vreification', 'please check your email for vreification');
      
      }
      Get.to(LoginPage());
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  void ApproveCompany(String? id, bool is_active) async {
    await _collectionReference
        .doc(id)
        .update({'is_active': is_active})
        .then((_) => Get.snackbar('Vreification', 'Success'))
        .catchError((error) => print('Failed: $error'));
  }
  void LogoutToLogin(){
    _auth.signOut();
    Get.to(LoginPage());


  }
}
