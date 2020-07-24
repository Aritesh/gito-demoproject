import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gito_project_demo/common/configuration/common_widgets.dart';
import 'package:gito_project_demo/common/configuration/db_helper.dart';
import 'package:gito_project_demo/common/configuration/login_data.dart';
import 'package:gito_project_demo/common/configuration/styles.dart';
import 'package:gito_project_demo/employees_section/add_employe/add_employe.dart';
import 'package:provider/provider.dart';

import 'employees_list_model.dart';
import 'employees_list_widget.dart';

class EmployeesList extends StatefulWidget {
  @override
  _EmployeesListState createState() => new _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  List<Employee> items = new List();
  DatabaseHelper db = new DatabaseHelper();

  int count = 0;

  @override
  Future<void> initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final model = Provider.of<EmployeesListModel>(context);
      model.initTask(context);
    });
    db.getAllEmployees().then((employees) {
      setState(() {
        employees.forEach((employee) {
          items.add(Employee.fromMap(employee));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeesListModel>(builder: (context, model, _) {
      count = items.length;
      print(count);
      return Scaffold(
        backgroundColor: TeacherPanelAppbarBackgroundColor,
        appBar: appBarWidget(haddingText: "Add employees"),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              heightSpace(10.0),
              _addCompanyDirectButton(),
              heightSpace(10.0),
              count.toString() == '0'
                  ? Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50.0,
// height: 50.0,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.deepPurpleAccent),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "Record not found",
                              style: TextStyle(fontSize: 17.0),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    )
                  : listViewB(items)
            ],
          ),
        ),
//          floatingActionButton: FloatingActionButton(
//            child: Icon(Icons.add),
//            onPressed: () => _createNewNote(context),
//          ),
      );
    });
  }

  void _deleteNote(
      BuildContext context, Employee employee, int position) async {
    db.deleteEmployee(employee.id).then((notes) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

//  void _navigateToNote(BuildContext context, Employee employee) async {
//    String result = await Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => EmployeeProfile()),
//    );
//
//    if (result == 'update') {
//      db.getAllEmployees().then((employees) {
//        setState(() {
//          items.clear();
//          employees.forEach((employee) {
//            items.add(Employee.fromMap(employee));
//          });
//        });
//      });
//    }
//  }

  void _createNewNote(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddEmployee(Employee('', '', '', '', '', ''))),
    );

    if (result == 'save') {
      db.getAllEmployees().then((notes) {
        setState(() {
          items.clear();
          notes.forEach((note) {
            items.add(Employee.fromMap(note));
          });
        });
      });
    }
  }

  Widget _addCompanyDirectButton() {
    return Container(
        height: 26,
        width: 26,
        child: GestureDetector(
          key: Key('add'),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.deepPurpleAccent)),
            child: Icon(
              Icons.add,
              size: 20.0,
              color: Colors.deepPurpleAccent,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddEmployee(Employee('', '', '', '', '', ''))));
//            debugPrint('FAB clicked');
//            navigateToDetail(Todo('', '', ''), 'Add Todo');
          },
        ));
  }
}
