import 'package:flutter/material.dart';
import 'package:gito_project_demo/common/configuration/common_widgets.dart';
import 'package:gito_project_demo/common/configuration/db_helper.dart';
import 'package:gito_project_demo/common/configuration/size_config.dart';
import 'package:gito_project_demo/common/configuration/styles.dart';
import 'package:gito_project_demo/employees_section/employees_list/employees_list.dart';

DatabaseHelper db = new DatabaseHelper();
ListView listViewWidget(BuildContext context, double width, widget) {
  return ListView(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.arrow_back,
                size: 25.0,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'PROFILE',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              child: Icon(
                Icons.delete,
                size: 25.0,
                color: Colors.red,
              ),
              onTap: () {
                db.deleteEmployee(widget.params.id);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => EmployeesList()),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
      SizedBox(
        height: 50,
      ),
      imageWidget(),
      SizedBox(
        height: 20.0,
      ),
      columnNameWidget(width, widget),
    ],
  );
}

Stack imageWidget() {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Image.asset(
        'assets/images/zigzik.png',
        height: 150.0,
        width: 300.0,
        color: Colors.white,
      ),
      Container(
        height: 150.0,
        width: 150.0,
        decoration: BoxDecoration(
          color: Colors.red,
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new ExactAssetImage('assets/images/student.jpeg'),
          ),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
        ),
        child: Container(
          height: 140.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.only(top: 18.0, bottom: 10.0),
        ),
      ),
    ],
  );
}

Column columnNameWidget(double width, widget) {
  return Column(
    children: <Widget>[
      Text(
        widget.params.firstName + " " + widget.params.lastName,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24.0),
      ),
      SizedBox(
        height: 15.0,
      ),
      Row(
        //    crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 9.14 * SizeConfig.textMultiplier,
            width: 9.14 * SizeConfig.textMultiplier,
            decoration: BoxDecoration(
              color: Color(0XFFF5F5F5),
              borderRadius: BorderRadius.all(
                  Radius.circular(2.74 * SizeConfig.textMultiplier)),
            ),
            child: Center(
              child: Icon(
                Icons.group,
                size: 5.48 * SizeConfig.textMultiplier,
              ),
            ),
          ),
          widthSpace(1.8 * SizeConfig.textMultiplier),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "280K",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: pRubikRegular,
                    fontSize: 3.3 * SizeConfig.textMultiplier,
                    letterSpacing: 0.09 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w800),
              ),
              heightSpace(0.91 * SizeConfig.textMultiplier),
              Text(
                "Followers",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: pRubikRegular,
                    fontSize: 2.74 * SizeConfig.textMultiplier,
                    letterSpacing: 0.09 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          widthSpace(2.74 * SizeConfig.textMultiplier),
          Container(
            height: 9.1 * SizeConfig.textMultiplier,
            width: 9.1 * SizeConfig.textMultiplier,
            decoration: BoxDecoration(
              color: Color(0XFFF5F5F5),
              borderRadius: BorderRadius.all(
                  Radius.circular(3.6 * SizeConfig.textMultiplier)),
            ),
            child: Center(
              child: Icon(
                Icons.star_border,
                size: 5.5 * SizeConfig.textMultiplier,
              ),
            ),
          ),
          widthSpace(1.8 * SizeConfig.textMultiplier),
          columnRatingWidget()
        ],
      ),
      heightSpace(4 * SizeConfig.textMultiplier),
      mobileNoWidget(width, widget)
    ],
  );
}

Column columnRatingWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "5.0",
        style: TextStyle(
            color: Colors.white,
            fontFamily: pRubikRegular,
            fontSize: 3.3 * SizeConfig.textMultiplier,
            letterSpacing: 0.09 * SizeConfig.textMultiplier,
            fontWeight: FontWeight.w800),
      ),
      heightSpace(0.91 * SizeConfig.textMultiplier),
      Text(
        "Ratings",
        style: TextStyle(
            color: Colors.white,
            fontFamily: pRubikRegular,
            fontSize: 2.74 * SizeConfig.textMultiplier,
            letterSpacing: 0.09 * SizeConfig.textMultiplier,
            fontWeight: FontWeight.w600),
      ),
    ],
  );
}

Container mobileNoWidget(double width, widget) {
  return Container(
    alignment: Alignment.centerLeft,
    //    height: 14.6 * SizeConfig.textMultiplier,
    width: width / 1.2,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.black, width: 0.22 * SizeConfig.textMultiplier),
        borderRadius:
            BorderRadius.all(Radius.circular(2.2 * SizeConfig.textMultiplier))),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 2 * SizeConfig.textMultiplier,
          vertical: 1.2 * SizeConfig.textMultiplier),
      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          heightSpace(0.91 * SizeConfig.textMultiplier),
          emailAddressWidget(widget),
          heightSpace(10.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.mobile_screen_share,
                size: 3.5 * SizeConfig.textMultiplier,
              ),
              widthSpace(25.0),
              Text(
                widget.params.mobileNo,
                style: TextStyle(
                    fontSize: 2.7 * SizeConfig.textMultiplier,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontFamily: pRubikRegular),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          heightSpace(10.0),
          homeAddressWidget(widget),
        ],
      ),
    ),
  );
}

Row homeAddressWidget(widget) {
  return Row(
    children: <Widget>[
      Icon(
        Icons.home,
        size: 3.5 * SizeConfig.textMultiplier,
      ),
      widthSpace(25.0),
      Container(
        width: 250.0,
        child: Text(
          widget.params.address,
          style: TextStyle(
              fontSize: 2.7 * SizeConfig.textMultiplier,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontFamily: pRubikRegular),
          textAlign: TextAlign.start,
        ),
      ),
    ],
  );
}

Row emailAddressWidget(widget) {
  return Row(
    children: <Widget>[
      Icon(
        Icons.email,
        size: 3.5 * SizeConfig.textMultiplier,
      ),
      widthSpace(25.0),
      Text(
        widget.params.email,
        style: TextStyle(
            fontSize: 2.7 * SizeConfig.textMultiplier,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontFamily: pRubikRegular),
        textAlign: TextAlign.start,
      ),
    ],
  );
}
