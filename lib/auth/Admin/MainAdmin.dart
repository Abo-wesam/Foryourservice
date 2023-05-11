import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Services/FirebaseAuth.dart';
import '../../views/Adminscreen/EditCompany.dart';
import '../../widget/SideMenu.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var currentPage = DrawerSections.EditCompany;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.EditCompany) {
      container = const EditCompany();}
    // else if (currentPage == DrawerSections.Addrole){
    //   container = Addrole();
    // }
    // } else if (currentPage == DrawerSections.contacts) {
    //   container = ContactsPage();
    // }
    // else if (currentPage == DrawerSections.events) {
    //   container = EventsPage();
    // } else if (currentPage == DrawerSections.notes) {
    //   container = NotesPage();
    // } else if (currentPage == DrawerSections.settings) {
    //   container = SettingsPage();
    // } else if (currentPage == DrawerSections.notifications) {
    //   container = NotificationsPage();
    // } else if (currentPage == DrawerSections.privacy_policy) {
    //   container = PrivacyPolicyPage();
    // } else if (currentPage == DrawerSections.send_feedback) {
    //   container = SendFeedbackPage();
    // }
    return Scaffold(
      appBar: AppBar(
        // leading:BackButton(
        //   color: Colors.black,
        //   onPressed: ()=>Firebase_Auth().LogoutToLogin(),// <-- SEE HERE
        // ),
        // backgroundColor: Colors.green[700],
        title: Center(child: Text("Admin Managment",)),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {
                    Firebase_Auth().LogoutToLogin(); // sign out user and close the drawer
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Managment", Icons.settings,
              currentPage == DrawerSections.EditCompany ? true : false),
          // menuItem(2, "Contacts", Icons.people_alt_outlined,
          //     currentPage == DrawerSections.Addrole ? true : false),
          // menuItem(3, "Events", Icons.event,
          //     currentPage == DrawerSections.events ? true : false),
          // menuItem(4, "Notes", Icons.notes,
          //     currentPage == DrawerSections.notes ? true : false),
          // Divider(),
          // menuItem(5, "Settings", Icons.settings_outlined,
          //     currentPage == DrawerSections.settings ? true : false),
          // menuItem(6, "Notifications", Icons.notifications_outlined,
          //     currentPage == DrawerSections.notifications ? true : false),
          // Divider(),
          // menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
          //     currentPage == DrawerSections.privacy_policy ? true : false),
          // menuItem(8, "Send feedback", Icons.feedback_outlined,
          //     currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.EditCompany;
            }
            // else if (id == 2) {
            //   currentPage = DrawerSections.Addrole;
            // }
            // else if (id == 3) {
            //   currentPage = DrawerSections.events;
            // } else if (id == 4) {
            //   currentPage = DrawerSections.notes;
            // } else if (id == 5) {
            //   currentPage = DrawerSections.settings;
            // } else if (id == 6) {
            //   currentPage = DrawerSections.notifications;
            // } else if (id == 7) {
            //   currentPage = DrawerSections.privacy_policy;
            // } else if (id == 8) {
            //   currentPage = DrawerSections.send_feedback;
            // }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  EditCompany

}
