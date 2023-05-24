import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'CarSteperModel.dart';

class Request_Model {
  late String? id_req;
  late int typeComp;
  late String? User_id;
  late String? NameUser;
  late String comp_id;
  late CarSteper? typeCar;
  late String TargetDestination;
  late String CurruntDestination;
  late String? Created_ON;
  late String? Target_place;
  late String Description;
  late int Status_req;
  Request_Model(
      {this.id_req,
      required this.typeComp,
      this.User_id,
      this.typeCar,
        this.NameUser,
      required this.TargetDestination,
      required this.CurruntDestination,
      required this.Description,
      required this.Status_req,
      this.Target_place,
      required this.comp_id,
      this.Created_ON});
  factory Request_Model.fromsnapshot(
      DocumentSnapshot<Map<String, dynamic>> _data) {
    final Data = _data.data()!;
    return Request_Model(
      id_req: Data['id_req'],
      typeComp: Data['typeComp'],
      User_id: Data['User_id'],
      typeCar: Data['typeCar'],
      NameUser: Data['NameUser'],
      TargetDestination: Data['TargetDestination'],
      CurruntDestination: Data['CurruntDestination'],
      Description: Data['Description'],
      Status_req: Data['Status_req'],
      Target_place: Data['Target_place'],
      comp_id: Data['comp_id'],
      Created_ON: Data['Created_ON'],
    );
  }
  tojson() {
    return {
      'id_req': id_req,
      'typeComp': typeComp,
      'User_id': User_id,
      'typeCar': typeCar,
      'NameUser': NameUser,
      'TargetDestination': TargetDestination,
      'CurruntDestination': CurruntDestination,
      'Description': Description,
      'Status_req': Status_req,
      'Target_place': Target_place,
      'comp_id': comp_id,
      'Created_ON': Created_ON,
    };
  }
}
