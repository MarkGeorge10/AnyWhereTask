import 'package:anywheretask/view/widgets/text_field/Validation.dart';
import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/styles.dart';
import 'form_input_decoration.dart';

class TextFields {


  Widget templateField(
      {
        double paddingTop = 0,
       double paddingBottom = 0,
       double paddingLeft = 0,
       double paddingRight = 0,
      required TextEditingController controller,
      required String txt,
      required int maxLength,
      IconData? suffxicon,
      IconData? prefxicon,
      String? hintText,
      FocusNode? myFocusNode,
      required VALIDATION_TYPE fieldType,
      String? confirmPass}) {
    return Padding(
        padding: EdgeInsets.only(
            top: paddingTop,
            bottom: paddingBottom,
            left: paddingLeft,
            right: paddingRight),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          maxLines: maxLength,
          focusNode: myFocusNode,
          controller: controller,
          keyboardType: (fieldType == VALIDATION_TYPE.EMAIL)
              ? TextInputType.emailAddress
              : (fieldType == VALIDATION_TYPE.TEXT)
                  ? TextInputType.text
                  : (fieldType == VALIDATION_TYPE.PHONE)
                      ? TextInputType.phone
                      : (fieldType == VALIDATION_TYPE.CARDNUMBER)
                          ? TextInputType.number
                          : TextInputType.text,
          obscureText: (fieldType == VALIDATION_TYPE.PASSWORD) ||
                  (fieldType == VALIDATION_TYPE.CONFIRM_PASSWORD)
              ? true
              : false,
          textCapitalization: TextCapitalization.words,
          cursorColor: kPrimaryColor,
          style: textButton,
          decoration: FormInputDecoration.decorateOutlineInputField(
              prefxicon: prefxicon,
              suffxicon: suffxicon,
              txt: txt,
              hintTxt: hintText),
          validator: (input) => checkFieldValidation(
            val: input,
            fieldType: fieldType,
            fieldName: txt,
            confirmPass: confirmPass,
          ),
        ),
    );
  }
}
