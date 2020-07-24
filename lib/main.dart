import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'common/configuration/size_config.dart';
import 'employees_section/add_employe/add_employe_model.dart';
import 'employees_section/employees_list/employees_list.dart';
import 'employees_section/employees_list/employees_list_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        builder: (_) => EmployeesListModel(),
      ),
      ChangeNotifierProvider(
        builder: (_) => AddEmployeeModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
      ),
    );
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: EmployeesList(),
              );
            },
          );
        },
      ),
    );
  }
}
