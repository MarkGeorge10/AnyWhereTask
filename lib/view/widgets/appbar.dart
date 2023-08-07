

import 'package:anywheretask/res/colors.dart';
import 'package:anywheretask/res/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class CustomAppBar extends PreferredSize {
  @override
  final String title;
  final double? height;


  CustomAppBar({
     this.height,
    required this.title,
  }) : super(child: Text(title), preferredSize: Size.fromHeight(height == null? 50:height));
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  PreferredSize(
      preferredSize: Size.fromHeight(height == null? 50.0:height!),
      child: AppBar(

        title:   Text(title,style: kHeaderTextStyle,),

        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: kPrimaryColor),
        // leading: IconButton(
        //     icon: const Icon(Icons.arrow_back),
        //     onPressed: onPressed
        // ),
      ),
    );
  }
}
