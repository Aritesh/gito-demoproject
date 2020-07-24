import 'package:flutter/foundation.dart';
import 'package:gito_project_demo/common/configuration/db_helper.dart';

class EmployeesListModel with ChangeNotifier {
  DatabaseHelper helper = DatabaseHelper();
  var _listData;
  List get listData => _listData;
  initTask(context) async {}

  set listData(List tErr) {
    _listData = tErr;
    notifyListeners();
  }
}
