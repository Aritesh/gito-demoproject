import 'package:flutter/material.dart';
import 'package:gito_project_demo/common/configuration/common_widgets.dart';
import 'package:gito_project_demo/common/configuration/styles.dart';
import 'package:gito_project_demo/employees_section/employee_profile/employee_profile.dart';

Expanded listViewB(items) {
  return Expanded(
    child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              '${items[index].firstName} ',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: pRubikRegular),
                            ),
                            Text(
                              '${items[index].lastName}  ',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: pRubikRegular),
                            )
                          ],
                        ),
                        heightSpace(10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '${items[index].mobileNo}  ',
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: pRubikRegular),
                            ),
                            Text(
                              '${items[index].email}  ',
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: pRubikRegular),
                            ),
                          ],
                        )
                      ]),
                )),
            onTap: () {
              debugPrint("ListTile Tapped");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmployeeProfile(items[index])));
            },
          ),
        );
      },
    ),
  );
}
