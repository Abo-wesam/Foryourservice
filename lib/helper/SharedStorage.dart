import 'package:shared_preferences/shared_preferences.dart';

import '../Services/FirebaseAuth.dart';

class SharedStorage {

  Future<bool?> checkForDisableUser() async {
     SharedPreferences preferences=await SharedPreferences.getInstance();

    bool? isDisablde = false;
    final result = await Firebase_Auth().GetUserbyid();
    if (result?.isDisablde == true) {
      isDisablde = true;
    }
    preferences.setBool('isDisablde', isDisablde);
    print(isDisablde);
    return isDisablde;
  }
}
