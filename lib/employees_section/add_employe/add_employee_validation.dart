import 'package:gito_project_demo/common/configuration/validation.dart';

class AddEmployeeValidation {
  validateEmailField(val, field) {
    final required = requiredField(val, field);
    if (required != null) {
      return required;
    }

    final minimumLength = minLength(val, field, 6);
    if (minimumLength != null) {
      return minimumLength;
    }
    final maximumLength = maxLength(val, field, 15);
    if (maximumLength != null) {
      return maximumLength;
    }

    final validEmail = validEmailField(val, field);
    if (validEmail != null) return validEmail;
  }

  validateFirstNameField(val, field) {
    final required = requiredField(val, field);
    if (required != null) {
      return required;
    }

    final minimumLength = minLength(val, field, 1);
    if (minimumLength != null) {
      return minimumLength;
    }
    final maximumLength = maxLength(val, field, 15);
    if (maximumLength != null) {
      return maximumLength;
    }
  }

  validateLastNameField(val, field) {
    final required = requiredField(val, field);
    if (required != null) {
      return required;
    }

    final minimumLength = minLength(val, field, 1);
    if (minimumLength != null) {
      return minimumLength;
    }
    final maximumLength = maxLength(val, field, 15);
    if (maximumLength != null) {
      return maximumLength;
    }
  }

  validateMobileNoField(val, field) {
    final required = requiredField(val, field);
    if (required != null) {
      return required;
    }
    final mobileNoCount = mobileNo(val, field);
    if (mobileNoCount != null) {
      return mobileNoCount;
    }
  }
}
