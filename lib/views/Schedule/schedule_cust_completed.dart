import 'package:flutter/material.dart';


import 'schedule_customer/schedule_cust_goingon.dart';

class ScheduleCustomerCompleted extends StatelessWidget {
  const ScheduleCustomerCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: schedules.length,
      itemBuilder: (context, index) {
        final schedule = schedules[index];
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
            elevation: 1,
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              
              children: <Widget>[
                ListTile(
                  leading: const Icon(
                    Icons.album,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text(schedule.name),
                  subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(schedule.order),
                      Text(schedule.destination_address),
                      Text(textAlign: TextAlign.left, 'Date: ' + schedule.date),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
