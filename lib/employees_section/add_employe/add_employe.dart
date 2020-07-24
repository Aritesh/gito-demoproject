import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gito_project_demo/common/configuration/common_widgets.dart';
import 'package:gito_project_demo/common/configuration/db_helper.dart';
import 'package:gito_project_demo/common/configuration/login_data.dart';
import 'package:gito_project_demo/common/configuration/size_config.dart';
import 'package:gito_project_demo/common/configuration/styles.dart';
import 'package:gito_project_demo/employees_section/add_employe/add_employe_model.dart';
import 'package:provider/provider.dart';

import 'add_employe_model.dart';
import 'add_employe_widget.dart';
import 'add_employee_validation.dart';

class AddEmployee extends StatefulWidget {
  final Employee employee;
  AddEmployee(this.employee);

  @override
  State<StatefulWidget> createState() => new _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  DatabaseHelper db = new DatabaseHelper();
  var addEmpVal = AddEmployeeValidation();
  final _formKey = GlobalKey<FormState>();
  Position _position;
  StreamSubscription<Position> _streamSubscription;
  Address _address;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () async {
      final model = await Provider.of<AddEmployeeModel>(context);
//      model.firstController =
//          new TextEditingController(text: widget.employee.firstName);
//      model.lastNameController =
//          new TextEditingController(text: widget.employee.lastName);
      model.initTask(context, widget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddEmployeeModel>(builder: (context, model, _) {
      return Scaffold(
        appBar: appBarWidget(haddingText: "Add employees"),
        body: Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 30.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                clickImage(context, model),
                firstNameField(model),
                heightSpace(15.0),
                lastNameField(model),
                heightSpace(15.0),
                emailField(model),
                heightSpace(15.0),
                mobileNoField(model),
                heightSpace(15.0),
                getCurentAddress(),
                heightSpace(30.0),
                currentAdd(model, context),
                heightSpace(15.0)
              ],
            ),
          ),
        ),
      );
    });
  }

  Container currentAdd(AddEmployeeModel model, BuildContext context) {
    return Container(
      height: 9.1 * SizeConfig.textMultiplier,
      child: RaisedButton(
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.9 * SizeConfig.textMultiplier),
        ),
        child: Text(
          "ADD EMPLOYEE",
          style: TextStyle(
            inherit: true,
            color: Color(0xFF655C5C),
            fontFamily: pRubikRegular,
            fontWeight: FontWeight.w700,
            fontSize: 2.81 * SizeConfig.textMultiplier,
            letterSpacing: 0.3,
          ),
        ),
        onPressed: () {
          model.submit(
              _formKey, context, widget, "${_address?.addressLine ?? '_'}");
        },
      ),
    );
  }

  Row getCurentAddress() {
    return Row(
      children: <Widget>[
        GestureDetector(
          child: Icon(
            Icons.place,
            size: 30.0,
            color: Colors.black,
          ),
          onTap: () {
            var locationOptions = LocationOptions(
                accuracy: LocationAccuracy.high, distanceFilter: 10);
            _streamSubscription = Geolocator()
                .getPositionStream(locationOptions)
                .listen((Position position) {
              setState(() {
                print(position);
                final coordinates =
                    Coordinates(position.latitude, position.longitude);
                convertCoordinatesToAddress(coordinates)
                    .then((value) => _address = value);
              });
            });
          },
        ),
        Container(
          width: 270.0,
          child: Text(
            "${_address?.addressLine ?? '_'}",
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //  _streamSubscription.cancel();
  }

  Future<Address> convertCoordinatesToAddress(Coordinates coordinates) async {
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first;
  }
}
