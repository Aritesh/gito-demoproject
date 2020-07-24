import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:gito_project_demo/common/configuration/db_helper.dart';

import 'employee_profile_widget.dart';

class EmployeeProfile extends StatefulWidget {
  final params;
  EmployeeProfile(this.params);
  @override
  _EmployeeProfileState createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  DatabaseHelper db = new DatabaseHelper();
  var _content1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      var _content1 = widget.params.imageU;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF686CE7), Color(0xFF5F9EEB)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          child: listViewWidget(context, width, widget),
        ),
      ),
    );
  }
}
