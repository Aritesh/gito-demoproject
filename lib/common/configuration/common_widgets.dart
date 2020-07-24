import 'package:flutter/material.dart';
import 'package:gito_project_demo/common/configuration/styles.dart';

AppBar appBarWidget({haddingText}) {
  return AppBar(
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 1,
    title: Text(
      haddingText.toString(),
      style: TextStyle(
          fontSize: 20.0,
          color: Colors.black54,
          fontWeight: FontWeight.w800,
          fontFamily: pRubikRegular
          //  fontFamily: pCommonRegularFont,
          ),
    ),
    backgroundColor: Colors.white,
  );
}

heightSpace(space) {
  return SizedBox(
    height: space,
  );
}

widthSpace(space) {
  return SizedBox(
    width: space,
  );
}
