import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gito_project_demo/widgets/text_fields.dart';
import 'package:provider/provider.dart';

import 'add_employe_model.dart';
import 'add_employee_validation.dart';

var addEmpVal = AddEmployeeValidation();
AllInputDesign mobileNoField(AddEmployeeModel model) {
  return AllInputDesign(
    key: Key("mobilenofield"),
    controller: model.mobileNoController,
    hintText: 'Mobile No',
    validatorFieldValue: 'Mobile No',
    validator: addEmpVal.validateMobileNoField,
    keyBoardType: TextInputType.text,
    inputFormatterData: [
      WhitelistingTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(10),
    ],
  );
}

AllInputDesign emailField(AddEmployeeModel model) {
  return AllInputDesign(
    key: Key("emailfield"),
    controller: model.emailNoController,
    hintText: 'Email',
    validatorFieldValue: 'Email id',
    validator: addEmpVal.validateEmailField,
    keyBoardType: TextInputType.text,
  );
}

AllInputDesign lastNameField(AddEmployeeModel model) {
  return AllInputDesign(
    key: Key("lastfield"),
    controller: model.lastNameController,
    hintText: 'Last name',
    validatorFieldValue: 'Last name',
    validator: addEmpVal.validateLastNameField,
    keyBoardType: TextInputType.text,
  );
}

AllInputDesign firstNameField(AddEmployeeModel model) {
  return AllInputDesign(
    key: Key("namefield"),
    controller: model.firstController,
    hintText: 'First name',
    validatorFieldValue: 'First name',
    validator: addEmpVal.validateFirstNameField,
    keyBoardType: TextInputType.text,
  );
}

Row clickImage(BuildContext context, AddEmployeeModel model) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      GestureDetector(
        child: Icon(
          Icons.add_a_photo,
          size: 30.0,
          color: Colors.black,
        ),
        onTap: () {
          final model = Provider.of<AddEmployeeModel>(context);
          model.takeCardPic();
        },
      ),
      SizedBox(
        width: 20.0,
      ),
      new Container(
        height: 140.0,
        width: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.only(top: 18.0, bottom: 10.0),
        child: model.content1 == null
            ? new Text("")
            : new Image.file(
                model.content1,
                fit: BoxFit.cover,
              ),
      ),
    ],
  );
}
