import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../view_model/register_view_model.dart';
import '../widget/custom_text_form_field.dart';
import '../widget/custom_textfield.dart';

class RegisterCustomer extends StatefulWidget {
  @override
  _RegisterCustomerstate createState() => _RegisterCustomerstate();
}

class _RegisterCustomerstate extends State<RegisterCustomer> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registrcontroller = Get.put(RegisterViewModel());
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      body: ListView(children: [
        Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFromField(
                  lable: 'FullName',
                  hint: 'Enter your FullName',
                  controller: registrcontroller.nameController,
                  icon: Icon(Icons.person),
                  validator: (text) => registrcontroller.errorName(text!),
                ),

                // registrcontroller.errorName(text!), ),
              ),
              const SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFromField(
                  lable: 'email',
                  hint: 'Enter your email',
                  controller: registrcontroller.emailController,
                  icon: Icon(Icons.alternate_email),
                  validator: (text) => registrcontroller.erroremail(text!),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFromField(
                  lable: 'password',
                  hint: 'Enter your password',
                  controller: registrcontroller.passwordController,
                  icon: Icon(Icons.password),
                  validator: (text) => registrcontroller.errorpass(text!),
                ),
              ),
              const SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFromField(
                  lable: 'Confirm password',
                  hint: 'Enter Confirm password',
                  controller: registrcontroller.passwordConfirmController,
                  // onSaved: (value) {
                  //   registrcontroller.passwordConfirmController = value;
                  // },
                  icon: Icon(Icons.password),
                  validator: (text) => registrcontroller.errorpassmatch(text!),
                ),
              ),

              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  controller: registrcontroller.AddressdController,
                  hintText: 'Enter Address',
                  labelText: 'Address',
                  icon: Icon(Icons.location_city),
                ),
              ),

              const SizedBox(height: 20),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: IconButton(
                    onPressed: () async {
                      ImagePicker imagePicker = ImagePicker();
                      XFile? file = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      print('${file?.path}');

                      if (file == null) return;
                      //Import dart:core
                      String uniqueFileName =
                          DateTime.now().millisecondsSinceEpoch.toString();

                      /*Step 2: Upload to Firebase storage*/
                      //Install firebase_storage
                      //Import the library

                      //Get a reference to storage root
                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDirImages =
                          referenceRoot.child('images');

                      //Create a reference for the image to be stored
                      Reference referenceImageToUpload =
                          referenceDirImages.child('name');

                      //Handle errors/success
                      try {
                        //Store the file
                        await referenceImageToUpload.putFile(File(file!.path));
                        //Success: get the download URL
                        registrcontroller.PhotoController =
                            (await referenceImageToUpload.getDownloadURL())
                                as TextEditingController;
                        print(registrcontroller.PhotoController.text);
                      } catch (error) {
                        //Some error occurred
                      }
                    },
                    icon: Icon(Icons.camera_alt),
                  )),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color(0xFF363f93),
                      fontSize: 22,
                    ),
                  ),
                  NeumorphicButton(
                    child: Icon(
                      Icons.arrow_circle_right,
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(top: 12),
                    onPressed: () {

                      if (formKey.currentState!.validate()) {
                        registrcontroller.submitRegister('Customer',context);
                      }
                    },
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.circle(),
                        color: Colors.indigo),
                  )
                ],
              ),

              // ElevatedButton(
              //   onPressed: ()=>registrcontroller.submitRegister('Customer',context),
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.all(Colors.blue),
              //     textStyle: MaterialStateProperty.all(
              //       const TextStyle(color: Colors.white),
              //     ),
              //     minimumSize: MaterialStateProperty.all(
              //       Size(MediaQuery.of(context).size.width / 2.5, 50),
              //     ),
              //   ),
              //   child: const Text(
              //     "Sign Up",
              //     style: TextStyle(color: Colors.white, fontSize: 16),
              //   ),
              // ),
            ],
          ),
        ),
      ]),
    );
  }
}
