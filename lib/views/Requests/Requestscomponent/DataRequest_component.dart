import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../widget/custom_text_form_field.dart';

class DataRequest extends StatefulWidget {

  @override
  State<DataRequest> createState() => _DataRequestState();
}
class _DataRequestState extends State<DataRequest>{
  late GoogleMapController _controller;
  late Position _currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(''),
    );
  }

}