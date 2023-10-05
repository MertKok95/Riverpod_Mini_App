import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  late String text;
  late double width;
  late double height;
  late double fontSize;
  late double radius;
  late double top;
  late double bottom;
  late double left;
  late double right;
  late double buttonVertical;
  late double buttonHorizontal;
  late double letterSpace;
  late Color color;
  late Color boxShadow;
  late Color textColor;
  late FontWeight fontWeight;
  late VoidCallback onPressed;

  ButtonWidget({
    Key? key,
    required this.text,
    this.width = double.infinity,
    required this.height,
    this.radius = 0,
    this.top = 0,
    this.bottom = 0,
    this.left = 0,
    this.right = 0,
    this.buttonVertical = 0,
    this.buttonHorizontal = 0,
    this.letterSpace = 0,
    this.color = const Color(0xff008FFF),
    this.boxShadow = const Color(0x60008FFF),
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 30,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin:
          EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          boxShadow: [
            BoxShadow(
              color: boxShadow,
              blurRadius: 10,
              offset: const Offset(0, 5),
              spreadRadius: 0,
            ),
          ]),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: buttonVertical, horizontal: buttonHorizontal),
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor,
                letterSpacing: letterSpace,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
