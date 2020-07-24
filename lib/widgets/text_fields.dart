import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gito_project_demo/common/configuration/common_functions.dart';
import 'package:gito_project_demo/common/configuration/size_config.dart';
import 'package:gito_project_demo/common/configuration/styles.dart';

class AllInputDesign extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final controller;
  final prefixText;
  final maxLine;
  final enabled;
  final hintText;
  final inputHeaderName;
  final prefixStyle;
  final validator;
  final errorText;
  final keyBoardType;
  final validatorFieldValue;
  final List<TextInputFormatter> inputFormatterData;
  final FormFieldSetter<String> onSaved;
  final obsecureText;
  final suffixIcon;

  const AllInputDesign({
    Key key,
    this.controller,
    this.maxLine = 1,
    this.enabled,
    this.prefixText,
    this.prefixStyle,
    this.keyBoardType,
    this.obsecureText,
    this.suffixIcon,
    this.hintText,
    this.inputHeaderName,
    this.validatorFieldValue,
    this.inputFormatterData,
    this.validator,
    this.onSaved,
    this.errorText,
    this.onChanged,
  }) : super(key: key);

  @override
  _AllInputDesignState createState() => _AllInputDesignState();
}

class _AllInputDesignState extends State<AllInputDesign> {
  var cf = CommonFunctions();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//        Text(
//          (widget.inputHeaderName != null) ? widget.inputHeaderName : '',
//          style: labelHintFontStyle,
//        ),
//        heightSpaceBetweenField(7.0),
        TextFormField(
          cursorColor: Colors.grey,
          maxLines: widget.maxLine,
          key: Key(cf.convertKey(widget.inputHeaderName)),
          onSaved: widget.onSaved,
          style: TextStyle(
            fontFamily: pRubikRegular,
            fontSize: 2.9 * SizeConfig.textMultiplier,
          ),
          keyboardType: widget.keyBoardType,
          validator: (val) => widget.validator(val, widget.validatorFieldValue),
          controller: widget.controller,
          enabled: widget.enabled,
          inputFormatters: widget.inputFormatterData,
          obscureText:
              widget.obsecureText != null ? widget.obsecureText : false,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0XFFF5F5F5),
              hintText: (widget.hintText != null) ? widget.hintText : '',
              hintStyle: inputHintStyle,
              errorText: widget.errorText,
              errorStyle: TextStyle(
                  fontFamily: pRubikRegular,
                  fontSize: 2.2 * SizeConfig.textMultiplier),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 2.7 * SizeConfig.textMultiplier,
                  vertical: 2.7 * SizeConfig.textMultiplier),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(1.5 * SizeConfig.textMultiplier),
                borderSide: BorderSide(color: Color(0xFFD6D6D6), width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xFFD6D6D6), width: 1.0),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: Color(0XFFF3F3F3), width: 1.0))),
        ),
      ],
    );
  }
}
