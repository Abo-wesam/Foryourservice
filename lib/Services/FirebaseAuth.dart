import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foryourservice/auth/login_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/Binding/CompanyModel.dart';
import '../utils/showSnackbar.dart';

class Firebase_Auth {
  final FirebaseAuth _auth;
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('Company');
  CollectionReference _referenceCustomer =
      FirebaseFirestore.instance.collection('Customer');
  Firebase_Auth(this._auth);

  User get user => _auth.currentUser!;

  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  Future<void> signUpWithEmail(
      dynamic model, BuildContext context, String typeOfRegist) async {
    try {
        await _auth.createUserWithEmailAndPassword(
        email: model.Email,
        password: model.Password,  );

      if (typeOfRegist == 'Company') {
        try {
          await _collectionReference
              .doc(_auth.currentUser?.uid.toString())
              .set(model.tojson());
          Get.to(LoginPage());
        } on FirebaseAuthException catch (e) {
          SnackBar(
            content: Text(e.message!),
          );
        }
      } else {
        try {
          await _referenceCustomer
              .doc(_auth.currentUser?.uid.toString())
              .set(model.tojson());

          Get.to(LoginPage());
          showSnackBar(context, 'Sucess');
        } on FirebaseAuthException catch (e) {
          content:
          Text(e.message!);
        }
      }
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

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Display error message
    }
  }
}
