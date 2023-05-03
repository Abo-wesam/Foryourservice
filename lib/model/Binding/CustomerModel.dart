import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel{
  late String?  Id ;
  late String Name;
  late String Email;
  late String Password;
  late String? Address;
  late String? Photo;
  late DateTime Created_ON;
  late DateTime ?Updated_ON;

  CustomerModel({this.Id,required this.Name,required  this.Email,required this.Password,  this.Address, this.Photo,required this.Created_ON, this.Updated_ON});
  factory CustomerModel.fromsnapshot(DocumentSnapshot<Map<String, dynamic>> _data){
    final Data = _data.data()!;
    return CustomerModel(
        Id: Data['Id'],
        Name: Data['Name'],
        Email: Data['Email'],
        Address:Data['Address'],
        Password: Data['Password'],
        Photo: Data['Photo'],
        Created_ON: Data['Created_ON'],
        Updated_ON: Data['Updated_ON']
    );
  }
    tojson() {
      return {
        'Id': Id,
        'Name': Name,
        'Email': Email,
        'Photo': Photo,
        'Password':Password,
        'Address': Address,
        'Created_ON': Created_ON,
        'Updated_ON': Updated_ON
      };
    }


}
