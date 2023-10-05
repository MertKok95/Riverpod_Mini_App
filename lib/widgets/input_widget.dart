import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class InputWidget extends StatelessWidget {
  final TextEditingController? controller;
  FormFieldSetter<String>? onSaved;
  String hintText;
  Widget? prefixIcon;
  bool obscureText;
  late double radius;
  late double focusedBorderRadius;
  late Color focusBorderSideColor;
  late double enabledBorderRadius;
  late Color enabledBorderSideColor;
  late double blurRadius;
  late double spreadRadius;
  late double offsetX;
  late double offsetY;
  late double marginTop;
  late double marginBottom;
  late double marginLeft;
  late double marginRight;
  late double fontSize;
  late double contentPaddingV;
  late double contentPaddingH;
  late double prefixIconConstraintsMinWidth;
  late Color textColor;
  late Color hintColor;
  late Color shadowColor;
  late Color fillColor;

  late FontWeight fontWeight;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;

  InputWidget({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.marginTop = 0,
    this.marginBottom = 20,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.radius = 50,
    this.blurRadius = 25,
    this.spreadRadius = -25,
    this.offsetX = 0,
    this.offsetY = 5,
    this.fontSize = 20,
    this.textColor = const Color(0xff000912),
    this.fillColor = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.shadowColor = const Color.fromRGBO(0, 0, 0, 1),
    this.focusedBorderRadius = 50,
    this.focusBorderSideColor = Colors.white,
    this.enabledBorderSideColor = Colors.white,
    this.enabledBorderRadius = 50,
    this.hintColor = const Color(0xffA6B0BD),
    this.contentPaddingV = 25,
    this.contentPaddingH = 0,
    this.prefixIconConstraintsMinWidth = 75,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: blurRadius,
            offset: Offset(offsetX, offsetY),
            spreadRadius: spreadRadius,
          ),
        ],
      ),
      margin: EdgeInsets.only(
          top: marginTop,
          bottom: marginBottom,
          left: marginLeft,
          right: marginRight),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        inputFormatters: inputFormatters ?? [],
        textAlign: TextAlign.start,
        obscureText: obscureText,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Bir değer giriniz";
          }
          return null;
        },
        onSaved: onSaved,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: contentPaddingV, horizontal: contentPaddingH),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
          ),
          fillColor: fillColor,
          filled: true,
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(
            minWidth: prefixIconConstraintsMinWidth,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(enabledBorderRadius),
            ),
            borderSide: BorderSide(color: enabledBorderSideColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(focusedBorderRadius),
            ),
            borderSide: BorderSide(color: focusBorderSideColor),
          ),
        ),
      ),
    );
  }
}
