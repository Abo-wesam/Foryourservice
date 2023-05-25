import 'package:flutter/material.dart';

class DialogDriver extends StatefulWidget {
  @override
  _DialogDriverState createState() => _DialogDriverState();
}

class _DialogDriverState extends State<DialogDriver> {
   
  String dropdownValue = 'Dog';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      title: const Text('Select a driver'),
      content: DropdownButtonFormField(
  decoration: const InputDecoration(
    enabledBorder: OutlineInputBorder( //<-- SEE HERE
      borderSide: BorderSide(color: Colors.blue, width: 2),
    ),
    focusedBorder: OutlineInputBorder( //<-- SEE HERE
      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
    ),
    filled: true,
    fillColor: Colors.lightBlue,
  ),
  dropdownColor: Colors.lightBlue,
  value: dropdownValue,
  onChanged: (String? newValue) {
    setState(() {
      dropdownValue = newValue!;
    });
  },
  items: <String>['Dog', 'Cat', 'Tiger', 'Lion'].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        value,
        style: TextStyle(fontSize: 20,color: Colors.white),
      ),
    );
  }).toList(),
),
      actions: <Widget>[
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Ok'),
          onPressed: () {
            // print('object: '+_selectedItem!);
            // Perform some action with the selected item here
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
