import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'Roles.dart';

class UserModel {
  late  String? User_id;
  late String Name;
  late String Address;
  late String Password;
  late String Email;
  late String Descrption;
  late String Photo;
  late  String? phone;
  late int? type_user;
  late int comp_Type;
  late bool is_active;
  late String? Role;
  late String Created_ON;
  late String? Updated_ON;


  UserModel(
      { this.User_id,
      required this.Name,
      required this.Email,
      required this.Address,
      this.phone,
      required this.Password,
      required this.comp_Type,
      required this.is_active,
      required this.Descrption,
      required this.Photo,
      this.type_user,
        this.Role,
      required this.Created_ON,
      this.Updated_ON,

      });
  factory UserModel.fromsnapshot(
      DocumentSnapshot<Map<String, dynamic>> _data) {
    final Data = _data.data()!;
    return UserModel(
      User_id: Data['User_id'],
        Name: Data['Name'],
        Password: Data['Password'],
        Email: Data['Email'],
        Address: Data['Address'],
        phone: Data['phone'],
        is_active: Data['is_active'],
        Photo: Data['Photo'],
        comp_Type: Data['comp_Type'],
        type_user: Data['type_user'],
      Role: Data['Role'],
        Descrption: Data['Descrption'],
        Created_ON:  Data['Created_ON'].toString() ,
        Updated_ON: Data['Updated_ON'],
   );
  }
  tojson() {
    return {
      'User_id': User_id,
      'Name': Name,
      'Email': Email,
      'Password': Password,
      'Address': Address,
      'phone': phone,
      'Photo': Photo,
      'is_active': is_active,
      'comp_Type': comp_Type,
      'type_user': type_user,
      'Role': Role,
      'Descrption': Descrption,
      'Created_ON': Created_ON,
      'Updated_ON': Updated_ON
    };
  }

  @override
  String toString() {
    return 'UserModel{name: $Name, email: $Email,TypeOfuser:$type_user}';
  }
}
