import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../helper/constant.dart';
import '../model/Binding/CompanyModel.dart';
import '../view_model/register_view_model.dart';
import '../widget/custom_text_form_field.dart';
import '../widget/custom_textfield.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final registrcontroller = Get.put(RegisterViewModel());

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder(
            future: registrcontroller.GetUserbyid(),
            builder: (
              context,
              snapshot,
            ) {
              print(snapshot.connectionState);

              if (snapshot.connectionState == ConnectionState.done) {

                print('Data${snapshot.hasData}');
                if (snapshot.hasData) {
                  UserModel userdata = snapshot.data as UserModel;
                   registrcontroller.AddressdController = TextEditingController(text: userdata.Address);
                   registrcontroller.nameController = TextEditingController(text: userdata.Name);
                   registrcontroller.passwordController = TextEditingController(text: userdata.Password);
                   registrcontroller.DescrptionController = TextEditingController(text: userdata.Descrption);
                   registrcontroller.phoneController = TextEditingController(text: userdata.phone);
                   registrcontroller.PhotoController = TextEditingController(text: userdata.Photo);
                  //  registrcontroller.TYpeUSerController = TextEditingController(text: userdata.type_user.toString());
                  //  registrcontroller.CompanyType = TextEditingController(text: userdata.comp_Type.toString());


                  return Container(
                    padding: EdgeInsets.only(left: 15, top: 20, right: 15),
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: ListView(
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 4, color: Colors.white),
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1),
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(Imagetest),
                                      )),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                        border: Border.all(
                                          width: 4,
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          registrcontroller.GetImagePicker();
                                        },
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextFromField(
                              lable: 'FullName',
                              hint: 'Enter your FullName',
                              controller: registrcontroller.nameController,
                              icon: Icon(Icons.person),
                              validator: (text) =>
                                  registrcontroller.errorName(text!),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextFromField(
                              lable: 'email',
                              hint: 'Enter your email',
                              controller: registrcontroller.emailController,

                              icon: Icon(Icons.alternate_email),
                              validator: (text) =>
                                  registrcontroller.erroremail(text!),
                              // registrcontroller.erroremail(text!),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextFromField(
                                lable: 'password',
                                hint: 'Enter your password',
                                controller:
                                    registrcontroller.passwordController,
                                icon: Icon(Icons.password),
                                validator: (text) {
                                  return registrcontroller.errorpass(text!);
                                }),
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
                            child: CustomTextField(
                              controller: registrcontroller.phoneController,
                              hintText: 'Phone number',
                              labelText: 'Phone',
                              icon: Icon(Icons.location_city),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            child: registrcontroller.TYpeUSerController.text ==
                                    "Company"
                                ? TextFormField(
                                    // enabled:( registrcontroller.TYpeUSerController.text =="") ? false : true,
                                    controller:
                                        registrcontroller.DescrptionController,
                                    decoration: const InputDecoration(
                                      hintText:
                                          'Enter Descrption For Your Company',
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                  )
                                : const SizedBox(height: 5),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.blue),
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontSize: 15,
                                      letterSpacing: 2,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    
                                    registrcontroller.UpdateUser(userdata);
                                  },
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                      fontSize: 15,
                                      letterSpacing: 2,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return Text('LodingData');
              }
              return Text('data');
            }),
      ),
    );
  }
}
