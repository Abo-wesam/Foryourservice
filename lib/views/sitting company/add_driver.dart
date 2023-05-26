import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../model/Binding/DriversModel.dart';
import '../../view_model/SettingController.dart';

class Person {
  int id;
  String name;
  int age;

  Person({required this.id, required this.name, required this.age});
}


class AddDriver extends StatefulWidget {
  @override
  _AddDriverState createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
   final controller = Get.put(SettingController());
  List<Person> _persons = [
    Person(id: 1, name: 'John Doe', age: 30),
    Person(id: 2, name: 'Jane Smith', age: 25),
  ];
  

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  String? _selectedId;

  void _addPerson() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Person'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Age is required';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Age must be a number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                 final drmodel=   driverModel(Name:  _nameController.text,is_active: true,phone:_phoneController.text );
                  
                    _nameController.clear();
                    _phoneController.clear();
                    Navigator.pop(context);
                  });
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _editPerson(driverModel driver) {
   _showEditDialog(driver);
  }

  void _deletePerson(String id) {
    setState(() {
      controller.deletedriver(id);
      
    });
  }

  void _showEditDialog(driverModel driver) {
    print(driver.Id_driv);
    _selectedId = driver.Id_driv;
    _nameController.text = driver.Name;
    _phoneController.text = driver.phone.toString();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Driver'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone is required';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Phone must be a number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    print(_nameController.text);
                    driver.Name=_nameController.text;
                    driver.phone=_phoneController.text;
                    controller.updatedriver(driver);

                    // Person updatedPerson = Person(
                    //   id: _selectedId!,
                    //   name: _nameController.text,
                    //   age: int.parse(_phoneController.text),
                    // );
                   
                   
                    _nameController.clear();
                    _phoneController.clear();
                    _selectedId = null;
                    Navigator.pop(context);
                  });
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
   
    
    return Scaffold(
      appBar: AppBar(
        title: Text('My Drivers'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<driverModel>>(
          future: controller.Getdrivers(),//getcompany by comptype
          builder: (
            context,
            snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // show a loading indicator while waiting for the data
            } else if (snapshot.hasError) {
              return Text(
                  'Error: ${snapshot.error}'); // show an error message if the asynchronous operation failed
            } else {
              List<driverModel> drivers = snapshot.data!;

              
         
        
        
        return   DataTable(
          columns: [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Phone')),
            DataColumn(label: Text('Actions')),
          ],

          rows:  drivers
              .map(
                (driver) => DataRow(
                  cells: [
                    DataCell(Text(driver.Name)),
                    DataCell(Text(driver.phone.toString())),
                    DataCell(Row(
                      children: [
                        IconButton(
                          onPressed: () => _editPerson(driver),
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: ()=> _deletePerson(driver.Id_driv!),
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    )),
                  ],
                ),
              )
              .toList(),
        );
    
            }})),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPerson,
        child: Icon(Icons.add),
      ),
    );
  }
}