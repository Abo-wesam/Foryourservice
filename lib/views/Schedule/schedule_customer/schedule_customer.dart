import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'schedule_cust_completed.dart';
import 'schedule_cust_goingon.dart';



class ScheduleCustomer extends StatelessWidget {
  const ScheduleCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: 
        
        AppBar(
          flexibleSpace: const SafeArea(
            child: TabBar(
              indicatorColor: Color.fromRGBO(255, 255, 255, 1),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4,
              indicatorPadding: EdgeInsets.only(top: 4),
              labelColor: Color.fromRGBO(255, 255, 255, 1),
              unselectedLabelColor: Color.fromRGBO(224, 226, 228, 1),
              tabs: [
                
                Tab(child: Text('On going', style: TextStyle(fontSize: 18))),
                Tab(child: Text('Completed', style: TextStyle(fontSize: 18))),
              ],
            ),
          ),
         
        ),

        body:  TabBarView(
          children: [
            ScheduleCustomerGoing(),
            ScheduleCustomerCompleted(),
            
          ],
        ),
      ),
    );

  }
}