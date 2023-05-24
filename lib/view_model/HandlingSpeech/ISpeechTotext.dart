import '../../model/Binding/CompanyModel.dart';
import '../../model/Binding/Service.dart';

abstract class ISpeechTotext {
    void startListening();
  void stopListening();
  int findSelectedIndex(String spokenText);
  void speakListHome(List<Service> _dataOfService);
  void speakListcompanylist(List<UserModel> complist);
}