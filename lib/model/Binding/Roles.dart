import 'package:cloud_firestore/cloud_firestore.dart';


class Roles {
  final String? User_id;
  final String? Role;



  Roles({this.User_id, this.Role});
  // Roles({this.id, this.roleName, this.roleDescription, this.createdAt, this.updatedAt});

  factory Roles.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {


    return Roles(
        User_id: json['User_id'] as String,
      Role: json['Role'] as String,
    );


  }

  @override
  tojson() {
    return {
      'User_id': User_id,
      'Role': Role,


    };
  }
}