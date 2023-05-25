import 'package:flutter/material.dart';

import '../../model/Binding/RequestModel.dart';
import 'dialog_driver.dart';

class ScheduleCompanyFind extends StatelessWidget {
  const ScheduleCompanyFind({super.key});

  @override
  Widget build(BuildContext context) {
    List<Request_Model> requestModel = [];
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: requestModel.length,
      itemBuilder: (context, index) {
        final requestModelFind = requestModel[index];
        return Padding(
          padding: const EdgeInsets.all(2.0),
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
                    Icons.person,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text(
                    requestModelFind.NameUser!,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(requestModelFind.Created_ON!),
                      Text('Type of Car: ${requestModelFind.typeCar}'),
                      Text(
                          textAlign: TextAlign.left,
                          'Destination Address:${requestModelFind.TargetDestination}'),
                    ],
                  ),
                ),
                ButtonTheme(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text('Cancel'),
                        onPressed: () {/* ... */},
                      ),
                      ElevatedButton(
                        child: const Text('Accept'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DialogDriver();
                            },
                          );
                        },
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
