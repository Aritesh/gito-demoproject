requiredField(val, field) {
  if (val.isEmpty) {
    return field + ' is required';
  }
}

String minLength(String value, fieldName, minLength) {
  if (value != "") {
    if (value.length < minLength)
      return fieldName +
          " should be minimum " +
          minLength.toString() +
          " characters";
  }
  return null;
}

String maxLength(String value, fieldName, maxLength) {
  if (value != null) {
    if (value.length > maxLength)
      return fieldName +
          " should not be more than " +
          maxLength.toString() +
          " characters";
  }
  return null;
}

mobileNo(val, field, [min = '10', max = '10']) {
  final RegExp nameExp = new RegExp("^\\w{$min,$max}\$");
  if (!nameExp.hasMatch(val)) return "Please enter 10 digit mobile no";
}

validEmailField(val, field) {
  final RegExp nameExp =
      new RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
  if (!nameExp.hasMatch(val)) return 'Please enter valid email address.';
}
