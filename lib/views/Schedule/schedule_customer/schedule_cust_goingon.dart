import 'package:flutter/material.dart';



class ScheduleCustomerGoing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final schedule = schedules;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children:<Widget>[ Card(
          elevation: 1,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: const Text(
                  'Services Provider',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(schedule[0].name),
                    Text(schedule[0].destination_address),
                  ],
                ),
              ),
              const Divider(
                height: 5,
                thickness: 2,
                color: Colors.grey,
              ),
              ListTile(
                title: const Text(
                  'Type Requet',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(schedule[0].name),
                  ],
                ),
              ),
              const Divider(
                height: 5,
                thickness: 2,
                color: Colors.grey,
              ),
              ListTile(
                
                title: const Text(
                  ' Driver'"s" 'Name ',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(schedule[0].name),
                  ],
                ),
              ),
              const Divider(
                height: 5,
                thickness: 2,
                color: Colors.grey,
              ),
              ListTile(
                title: const Text(
                  'Data of car',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type: '+schedule[0].name),
                    Text('Number: '+schedule[0].name),
                  ],
                ),
              ),
              const Divider(
                height: 5,
                thickness: 2,
                color: Colors.grey,
              ),
              ListTile(
                title: const Text(
                  'Date & Time Selected',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(schedule[0].date),
                  ],
                ),
              ),
              const Divider(
                height: 5,
                thickness: 2,
                color: Colors.grey,
              ),
              ListTile(
                title: const Text(
                  'Destination Address',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(schedule[0].destination_address),
                  ],
                ),
              ),
              
            ],
          ),
        ),]
      ),
    );
  }
}
class Schedule {
final String  name ,date,order,destination_address;


Schedule(this.name, this.order, this.date,this.destination_address);



}

List <Schedule> schedules=[
  Schedule( 'Name of customer', 'Order: wash , shine , Detailing, Exterior wash ','27 May 2022 | 10:00 pm','Destination Address:eg: Riyadh- Alamariyah'),
  Schedule( 'Name of customer', 'Order: wash , shine , Detailing, Exterior wash ','27 May 2022 | 10:00 pm','Destination Address:eg: Riyadh- Alamariyah'),
  Schedule( 'Name of customer', 'Order: wash , shine , Detailing, Exterior wash ','27 May 2022 | 10:00 pm','Destination Address:eg: Riyadh- Alamariyah'),
  Schedule( 'Name of customer', 'Order: wash , shine , Detailing, Exterior wash ','27 May 2022 | 10:00 pm','Destination Address:eg: Riyadh- Alamariyah'),
  Schedule( 'Name of customer', 'Order: wash , shine , Detailing, Exterior wash ','27 May 2022 | 10:00 pm','Destination Address:eg: Riyadh- Alamariyah'),
];


