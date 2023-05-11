import 'package:cloud_firestore/cloud_firestore.dart';

import 'Roles.dart';

class CustomerModel{
  late String?  Id ;
  late String Name;
  late String Email;
  late String Password;
  late String? Address;
  final String? phone;
  late String? Photo;
  late DateTime Created_ON;
  late DateTime ?Updated_ON;
  final Roles? roles;


  CustomerModel({this.Id,required this.Name,required  this.Email,required this.Password,  this.Address, this.Photo,this.phone,required this.Created_ON, this.Updated_ON   ,  this.roles
  });
  factory CustomerModel.fromsnapshot(DocumentSnapshot<Map<String, dynamic>> _data){
    final Data = _data.data()!;
    return CustomerModel(
        Id: Data['Id'],
        Name: Data['Name'],
        Email: Data['Email'],
        Address:Data['Address'],
        phone: Data['phone'],
        Password: Data['Password'],
        Photo: Data['Photo'],
        Created_ON: Data['Created_ON'],
        Updated_ON: Data['Updated_ON'],
        roles: Roles.fromJson(Data['Role'])

    );
  }
    tojson() {
      return {
        'Id': Id,
        'Name': Name,
        'Email': Email,
        'Photo': Photo,
        'phone': phone,
        'Password':Password,
        'Address': Address,
        'Created_ON': Created_ON,
        'Updated_ON': Updated_ON
      };
    }
  @override
  String toString() {
    return 'Users{name: $Name, email: $Email}';
  }


}
