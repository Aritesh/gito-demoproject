import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_luban/flutter_luban.dart';
import 'package:gito_project_demo/common/configuration/config.dart';
import 'package:gito_project_demo/common/configuration/db_helper.dart';
import 'package:gito_project_demo/common/configuration/login_data.dart';
import 'package:gito_project_demo/employees_section/employees_list/employees_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class AddEmployeeModel with ChangeNotifier {
  TextEditingController firstController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailNoController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  DatabaseHelper db = new DatabaseHelper();

  var _content;
  var _content1;

  File image;
  File compressedFile;

  String base64Image;
  get content => _content;
  get content1 => _content1;

  initTask(context, widget) async {
    firstController.text = '';
    lastNameController.text = '';

    emailNoController.text = '';
    mobileNoController.text = '';
    content1 = null;
  }

  takeCardPic() async {
    image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: Configuration.imageQuality,
      maxWidth: Configuration.imageWidth,
    );
    if (image != null) {
      final tempDir = await getTemporaryDirectory();

      CompressObject compressObject = CompressObject(
        imageFile: image, //image
        path: tempDir.path, //compress to path
        quality:
            Configuration.imageQuality, //first compress quality, default 80
        step:
            7, //compress quality step, The bigger the fast, Smaller is more accurate, default 6
        mode: CompressMode.LARGE2SMALL, //default AUTO
      );

      Luban.compressImage(compressObject).then((_path) {
        image = File(_path);
        notifyListeners();
      });
      List<int> imageBytes = image.readAsBytesSync();
      base64Image = base64Encode(imageBytes);
      content = base64Image;
      content1 = image;
      notifyListeners();
    }
  }

  submit(_formKey, context, widget, address) async {
    if (_formKey.currentState.validate()) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      print("_______" + firstController.text);
      print("___1____" + lastNameController.text);
      if (widget.employee.id != null) {
        db
            .updateEmployee(Employee.fromMap({
          'id': widget.employee.id,
          'firstName': firstController.text,
          'lastName': lastNameController.text,
          'email': emailNoController.text,
          'mobileNo': mobileNoController.text,
          'address': address,
          'imageU': _content1
        }))
            .then((_) {
          Navigator.pop(context, 'update');
        });
      } else {
        db
            .saveEmployee(Employee(
                firstController.text,
                lastNameController.text,
                emailNoController.text,
                mobileNoController.text,
                address,
                _content1.toString()))
            .then((_) {
          notifyListeners();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => EmployeesList()),
              (_) => false);
        });
      }
    }
  }

  addressVali(address) {}

  set content1(var data) {
    _content1 = data;
    notifyListeners();
  }

  set content(var data) {
    _content = data;
    notifyListeners();
  }
}
