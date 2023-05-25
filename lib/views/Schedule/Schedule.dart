import 'package:flutter/material.dart';

import '../../helper/constant.dart';
import 'Completedreq.dart';
import 'Findreq.dart';
import 'Ongoing.dart';



class Schedule extends StatelessWidget {
  const Schedule({super.key});
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Schedule'),
          bottom: const TabBar(
            indicatorColor: Color.fromRGBO(255, 255, 255, 1),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4,
            indicatorPadding: EdgeInsets.only(top: 4),
            labelColor: Color.fromRGBO(255, 255, 255, 1),
            unselectedLabelColor: Color.fromRGBO(224, 226, 228, 1),
            tabs: [
              Tab(child: Text('Find', style: TextStyle(fontSize: 18))),
              Tab(child: Text('On going', style: TextStyle(fontSize: 18))),
              Tab(child: Text('Completed', style: TextStyle(fontSize: 18))),
            ],
          ),
        ),
        body:  const TabBarView(
          children: [
            ScheduleCompanyFind(),
            ScheduleCompanyGoinggo(),
            ScheduleCompanyCompleted(),
          ],
        ),
      ),
    );
  }

}
