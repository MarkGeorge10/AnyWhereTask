import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  GestureTapCallback? onPressed;
  final bool isLoading;
  final Widget child;
  final bool alignIconRight;
  final Color color;
  Color? textColor;
  final double? width;
  final double? height;
  OutlinedBorder? shape;

  CustomButton(
      {
        this.onPressed,

        required this.child,
        required this.isLoading,
        this.alignIconRight = false,
        required this.color,
        this.textColor,
         this.width,
         this.height,
        this.shape});

  createState() => new _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  TextStyle textStyle = const TextStyle(
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {

    var button = SizedBox(
      width: widget.width ,
      height: widget.height ,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
            primary:  widget.color ,
            padding: const EdgeInsets.all(0),
            shape: widget.shape
        ),


        child: widget.isLoading == true
            ? SizedBox(
          child: CircularProgressIndicator(
            backgroundColor: widget.color == Colors.white ? Colors.black:Colors.white,
            value: null,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.grey),
            strokeWidth: 2,
          ),
          height: 20,
          width: 20,
        )
            : (
            widget.child ),
        onPressed: widget.onPressed,
      ),
    );


    return button;
  }
}
