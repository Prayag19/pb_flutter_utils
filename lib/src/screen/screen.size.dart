import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';


class Responsive {
  late Size designSize;
  late BuildContext context;
  static Responsive? _instance;

  factory Responsive({required BuildContext context,required Size designSize, }) {
    _instance ??= Responsive._internal(
        designSize, context);
    return _instance!;
  }

  Responsive._internal(this.designSize, this.context);

   Responsive get instance {
    return _instance!;
  }

   double width(double width) {
    double factor = MediaQuery.of(context).size.width / designSize.width;
    return (width * factor).roundToDouble();
  }

   double height(double height) {
    double factor = MediaQuery.of(context).size.height / designSize.height;
    return (height * factor).roundToDouble();
  }

   double heightPer(double per) {
    double factor = MediaQuery.of(context).size.height * per / 100;
    return factor.roundToDouble();
  }

   double widthPer(double per) {
    double factor = MediaQuery.of(context).size.width * per / 100;
    return factor.roundToDouble();
  }

   double squareMin(double w, double h) {
    double factor = min(height(h), width(w));
    return factor.roundToDouble();
  }

   Widget getResponsiveSpace({double? w, double? h}) {
    return SizedBox(
      height: height(h ?? 0),
      width: width(w ?? 0),
    );
  }


}


