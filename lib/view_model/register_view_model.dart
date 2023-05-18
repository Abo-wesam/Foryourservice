import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController CompanyType= TextEditingController();
  late TextEditingController TYpeUSerController = TextEditingController();
late String id, FullName, email, password, confirmPassword;
  String? emailError, passwordError,nameError;

  // final bike = ''.obs;
   @override
     void onInit() {
      // tabController = TabController(vsync: this, length: 2);
      // bike.value='customer view model';
     nameController.value.text.isEmpty;
     emailController.value.text=='';
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
  int  get typecompany{
    if(CompanyType.text=='Delivery Services'){
      return 1;
    }else if (CompanyType.text=='Transportation'){
      return 2;
    }
     return 0;
  }
 void  setcompanytyp(String comp){
    CompanyType.text=comp;
    print(CompanyType.text);
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
   DateTime dateTime = DateTime.now();
   String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
   _auth = FirebaseAuth.instance;
     print(CompanyType.text);
       var _usermodel=UserModel(Name: nameController.value.text,Email: emailController.value.text,
         Address: AddressdController.value.text,
         Password: passwordController.value.text,
         comp_Type:typecompany,
         is_active: (TYpeUSerController.text=='Customr'?true:false) ,
         Descrption: DescrptionController.value.text,
         Photo:PhotoController.text,
         phone:phoneController.text ,
         type_user:(TYpeUSerController.text=='Customr'?1:2) ,
         Created_ON:  formattedDate,

       );
       Firebase_Auth().signUpWithEmail(_usermodel,context,typeOfRegist );


  }
  Future uploadFile() async{


  }
  void GetImagePicker() async {
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
   PhotoController =
      (await referenceImageToUpload.getDownloadURL())
    as TextEditingController;
    print(PhotoController.text);
    } catch (error) {
    //Some error occurred
    }
  }

 Future<List<UserModel>> GetuserProfile() {
     return   Firebase_Auth().GetUser();
 }
  Future<UserModel?> GetUserbyid()async {
     return  await Firebase_Auth().GetUserbyid();
 }

  void UpdateUser(UserModel userdata) async{
    userdata.Address=AddressdController.value.text;
userdata.Name  =nameController.value.text;
userdata.Email  =emailController.value.text;
userdata.Password  =passwordController.value.text;
userdata.Photo  = PhotoController.text;
userdata.phone  = phoneController.text ;
     
await Firebase_Auth().UpdateUserProfile(userdata);

  }




}

