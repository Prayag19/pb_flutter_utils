import 'package:flutter/material.dart';

class AppColor {
  static const Color greyText = Color(0xff808080);
  static const Color primary = Colors.blueGrey;
  static const Color darkBg = Color(0xff293846);
  static const Color lightGreyBg = Color(0xffF0F0F0);
  static const Color chipOrange = Color(0xFFE7CC41);
  static const Color green = Color(0xFF2BC999);
  static const Color white = Colors.white;
  static const Color blackText = Colors.black;
  static const Color salmon = Color(0xffFF5E5B);

  static BoxDecoration shadowBoxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: const [
        BoxShadow(
          color: Color(0x33161616),
          offset: Offset(0, 10),
          blurRadius: 24,
        ),
      ]);

  static BoxDecoration borderBoxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Colors.blueGrey));

  static BoxDecoration borderBoxDecoration2 = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0),
      border: Border.all(color: Colors.black12));

  static BoxDecoration normalBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
  );

  static BoxDecoration glassBoxDecoration = BoxDecoration(
    color: Colors.white.withOpacity(0.9),
    borderRadius: BorderRadius.circular(8),
  );

}
