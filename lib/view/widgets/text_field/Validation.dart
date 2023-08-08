// ignore_for_file: camel_case_types, constant_identifier_names, non_constant_identifier_names


enum VALIDATION_TYPE {
  EMAIL,
  TEXT,
  PHONE,
  CARDNUMBER,
  PASSWORD,
  CONFIRM_PASSWORD,
  MAHER
}

RegExp EMAIL_REGEX = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

String? isRequired(String val, String fieldName) {
  if (val == '') {
    return "$fieldName is required";
  }
  return null;
}

String? checkPasswordLength(String val) {
  if (val.length < 6) {
    return 'Password must be 6 digit';
  }
  return null;
}

String? checkFieldValidation(
    {required String? val,
    required String fieldName,
    required VALIDATION_TYPE fieldType,
    String? confirmPass}) {
  String? errorMsg;

  if (fieldType == VALIDATION_TYPE.TEXT) {
    errorMsg = isRequired(val!, fieldName);
  }

  if (fieldType == VALIDATION_TYPE.EMAIL) {
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (!EMAIL_REGEX.hasMatch(val)) {
      errorMsg = "Please enter valid email";
    }
  }

  if (fieldType == VALIDATION_TYPE.MAHER) {
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (!EMAIL_REGEX.hasMatch(val)) {
      errorMsg = "Please enter valid email";
    }
  }

  if (fieldType == VALIDATION_TYPE.PASSWORD) {
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (checkPasswordLength(val) != null) {
      errorMsg = checkPasswordLength(val);
    }
  }

  if (fieldType == VALIDATION_TYPE.PHONE) {
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (val.length < 8) {
      errorMsg = "Phone number must be 8 digits";
    } else if (val.length > 8) {
      errorMsg = "Phone number must be 8 digits";
    }
  }

  if (fieldType == VALIDATION_TYPE.CARDNUMBER) {
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (val.length <= 11) {
      errorMsg = "Card Number must be 12 digits";

    }
  }

  if (fieldType == VALIDATION_TYPE.CONFIRM_PASSWORD) {
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (checkPasswordLength(val) != null) {
      errorMsg = checkPasswordLength(val);
    } else if (val != confirmPass) {
      errorMsg = "Confirm password must be same as password";


    }
  }

  return (errorMsg != null) ? errorMsg : null;
}
