import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/styles.dart';

class FormInputDecoration extends InputDecoration {
  /*
    * Input field border design
    * @param string : Placeholder name
    * */
  static FormInputDesign({required String name, required String errorText}) {
    return InputDecoration(
      // icon: name == "Password"?Icon(Icons.lock_outline):Icon(Icons.alternate_email),
        contentPadding:
        EdgeInsets.only(top: 12, bottom: 12, left: 10, right: 10),
        filled: true,
        enabledBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.transparent)),
        disabledBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.transparent)),
        border: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.transparent)),
        fillColor: Colors.grey[100],
        hintStyle: TextStyle(letterSpacing: 1.2, color: Colors.grey[500]),
        errorMaxLines: 3,
        hintText: (name).toUpperCase(),
        errorStyle: TextStyle(
            letterSpacing: 1.2, decorationStyle: TextDecorationStyle.dashed));
  }


  static TextStyle CustomInputTextStyle() {
    return  TextStyle(
        fontFamily: "WorkSansSemiBold",
        fontSize: 16.0,
        color: Colors.black);
  }

  static InputDecoration decorateOutlineInputField({required IconData? suffxicon,required IconData? prefxicon,required String txt, String? hintTxt}){
    return InputDecoration(

      focusedBorder:   OutlineInputBorder(

        borderSide: BorderSide(
          color: kPrimaryColor,
        ),
      ),

      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: kPrimaryColor,
        ),
      ),
      prefixIcon: Icon(
        prefxicon,

        color: Colors.black,
      ),
      suffixIcon:Icon(
        suffxicon,

        color: Colors.black,
      ) ,
      hintText: hintTxt ?? "",
      labelText: txt,
      labelStyle: TextStyle(color: kPrimaryColor),
      hintStyle: const TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0,),


    );
  }
}
