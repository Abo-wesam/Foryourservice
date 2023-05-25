import 'package:flutter/material.dart';

import '../../model/Binding/RequestModel.dart';
import 'Schedule.dart';

class ScheduleCompanyGoinggo extends StatelessWidget {
  const ScheduleCompanyGoinggo({super.key});

  @override
  Widget build(BuildContext context) {
    List<Request_Model> requestModel=[];
    return ListView.builder(

      scrollDirection: Axis.vertical,
      itemCount: requestModel.length,
      itemBuilder: (context, index) {
        final requestModelGoing = requestModel[index];
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
                  leading: const Icon(Icons.album, color: Colors.blue,
                    size: 30,),
                  title: Text(requestModelGoing.NameUser!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(requestModelGoing.Description),
                      Text(requestModelGoing.TargetDestination),
                      Text(textAlign: TextAlign.left,  requestModelGoing.Created_ON!),
                    ],
                  ),
                ),
                ButtonTheme(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        child: const Text('complete'),
                        onPressed: () {/* ... */},
                      ),
                      
                    ],
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
