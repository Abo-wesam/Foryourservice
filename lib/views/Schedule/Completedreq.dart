import 'package:flutter/material.dart';

import '../../model/Binding/RequestModel.dart';


class ScheduleCompanyCompleted extends StatelessWidget {
  const ScheduleCompanyCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    List<Request_Model> requestModel=[];
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: requestModel.length,
      itemBuilder: (context, index) {
        final requestModelComp = requestModel[index];
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
                  title: Text(requestModelComp.NameUser!),
                  subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(requestModelComp.Created_ON!),
                      Text('${requestModelComp.typeCar}'),
                      Text(textAlign: TextAlign.left, requestModelComp.Description),
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
