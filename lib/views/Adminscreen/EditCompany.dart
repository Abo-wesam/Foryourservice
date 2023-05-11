import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/Binding/CompanyModel.dart';
import '../../model/Binding/Roles.dart';
import '../../view_model/dashboard_view_model.dart';

class EditCompany extends StatefulWidget {
  const EditCompany({super.key});

  @override
  State<EditCompany> createState() => _EditCompanyState();
}

class _EditCompanyState extends State<EditCompany> {
  bool isChecked = false;
@override
  Widget build(BuildContext context) {

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    DashboardController controller=Get.put(DashboardController());
    return Scaffold(

      body:  Row(children: <Widget>[
        Expanded(
          child: FutureBuilder<List<UserModel>>(
              future: controller.GetCompany(),
              builder: (
                  context,
                  snapshot,
                  ) {
                if (snapshot.connectionState == ConnectionState.done) {
                  print(snapshot.connectionState );
                  print(snapshot.hasData);
                  // print(snapshot.data?.length);
                  if (snapshot.hasData) {
                    print(snapshot.hasData);
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            // margin:const EdgeInsets.only(left:20,right: 20) ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),

                              // color: Colors.blue
                            ),
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                //   color: Colors.blueAccent,
                                // color: Color(0xFF6200EE).withOpacity(0.08),
                              ),
                              child: Row(

                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),

                                  Container(
                                    child: Text(
                                      snapshot.data![index].Name!,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),

                                  ),
                                  SizedBox(width: 50),
                                  Checkbox(
                                      value:isChecked,
                                      fillColor: MaterialStateProperty.resolveWith(getColor),
                                      checkColor: Colors.white,
                                      onChanged: ( val){
                                setState(() {
                                  isChecked=val!;
                                });
                                      }),
                                  IconButton(
                                    onPressed:(){
                                    controller.updateCompany(snapshot.data![index].User_id, isChecked);

                                  } , icon: Icon( Icons.edit),
                                    hoverColor:Color(0xFF6200EE),
                                  ),
                                ],
                              ),
                            ),

                          );
                        });
                  }
                  return Text("....Loding Data ");
                }
                return Text("Connection filed");
              }),
        ),
      ]),
    );
  }



}