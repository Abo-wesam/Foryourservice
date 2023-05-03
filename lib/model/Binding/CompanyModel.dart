import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyModel {
  late String?  Id ;
  late String Name;
  late String Address;
  late String Password;
  late String Email;
  late String Descrption;
  late String Photo;
  late int comp_Type;
  late bool  is_active;
  late DateTime Created_ON;
  late DateTime? Updated_ON;

  CompanyModel({ this.Id, required this.Name, required this.Email, required this.Address, required this.Password,required this.comp_Type,required this.is_active,required this.Descrption,required this.Photo, required this.Created_ON,  this.Updated_ON});
  factory CompanyModel.fromsnapshot(DocumentSnapshot<Map<String, dynamic>> _data){
    final Data = _data.data()!;
    return  CompanyModel(
        Id:Data['Id'],
        Name:Data['Name'],
        Password:Data['Password'],
        Email:Data['Email'],
        Address:Data['Address'],
        is_active:Data['is_active'],
        Photo:Data['Photo'],
        comp_Type:Data['comp_Type'],
        Descrption:Data['Descrption'],
        Created_ON:Data['Created_ON'],
        Updated_ON:Data['Updated_ON']
    );





  }
  tojson() {
    return {
      'Id': Id,
      'Name': Name,
      'Email': Email,
      Password:Password,
      'Address': Address,
      'Photo': Photo,
      'is_active': is_active,
      'comp_Type':comp_Type,
      'Descrption':Descrption,
      'Created_ON': Created_ON,
      'Updated_ON': Updated_ON
    };
  }
}