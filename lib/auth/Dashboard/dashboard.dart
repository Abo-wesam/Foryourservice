import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:foryourservice/auth/login_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../RecordPage.dart';
import '../../Services/FirebaseAuth.dart';
import '../../utils/DashbordContent.dart';
import '../../view_model/SpeechController.dart';
import '../../view_model/dashboard_view_model.dart';
import '../../views/Home_Page.dart';

class dashboard extends StatefulWidget {
  @override
  _dashboarde createState() => _dashboarde();
}

class _dashboarde extends State<dashboard> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final role =Firebase_Auth().getRoles();
    final speech = Get.put(SpeechController());
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Firebase_Auth().LogoutToLogin(), // <-- SEE HERE
        ),
        title: Dashbordcontent.hedercontent(currentIndex, role!)
      ),
      backgroundColor: Colors.white10,
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children:Dashbordcontent.getchildren(role)
          ),
          // controller.currentIndex==0 ? const HomePage(): controller.currentIndex==1 ? LoginPage() :LoginPage()

          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                  clipBehavior: Clip.none,
                  children: Dashbordcontent.ContentOfdownbar(role, size, setBottomBarIndex, currentIndex, speech)),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
