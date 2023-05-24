import 'package:cloud_firestore/cloud_firestore.dart';

class driverModel {
  late String? Id_driv;
  late String Id_comp;
  late String Name;
  late String? Created_ON;
  late bool is_active;
  late String? phone;
  driverModel(
      {this.Id_driv,
      required this.Name,
      this.phone,
      this.Created_ON,
      required this.is_active,
      required this.Id_comp});
  factory driverModel.fromsnapshot(
      DocumentSnapshot<Map<String, dynamic>> _data) {
    final Data = _data.data()!;
    return driverModel(
      Id_driv: Data['Id_driv'],
      Id_comp: Data['Id_comp'],
      Name: Data['Name'],
      Created_ON: Data['Created_ON'],
      phone: Data['phone'],
      is_active: Data['is_active'],
    );
  }
  tojson() {
    return {
      'Id_driv': Id_driv,
      'Id_comp': Id_comp,
      'Name': Name,
      'Created_ON': Created_ON,
      'phone': phone,
      'is_active': is_active,
    };
  }
}
