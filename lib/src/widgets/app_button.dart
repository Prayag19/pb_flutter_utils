import 'package:flutter/material.dart';

import '../screen/colors.dart';
import '../screen/textstyle.dart';

class AppButton extends StatelessWidget {
  final String title;
  final leadingWidget;
  final bool loading;
  final double borderRadius;
  final double? width;
  final EdgeInsets? padding;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? loadingColor;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  const AppButton({
    required this.title,
    this.backgroundColor,
    this.loading = false,
    this.leadingWidget,
    this.width,
    this.loadingColor,
    this.height,
    this.textColor,
    this.textStyle,
    this.padding,
    this.onPressed,
    double? borderRadius,
    Key? key,
  })  : borderRadius = borderRadius ?? 5,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      child: loading
          ? SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration:
                    //AppColor.shadowBoxDecoration.copyWith
                      BoxDecoration(
                        color: backgroundColor ?? AppColor.primary,
                        borderRadius: BorderRadius.circular(borderRadius)),
                    height: height ?? 55,
                    width: height ?? 55,
                    child: Padding(
                      padding: padding?? EdgeInsets.all(15.0),
                      child: CircularProgressIndicator(
                        color: loadingColor ?? AppColor.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius)),
              width: width ?? double.infinity,
              height: height ?? 55,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    _getButtonBackgroundColor(onPressed),
                  ),
                  padding: MaterialStateProperty.all(padding??EdgeInsets.all(15)),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: leadingWidget != null ? 40 : 0,
                      child: leadingWidget ??
                          SizedBox(
                            width: 5,
                          ),
                    ),
                    Text(title,
                        style:textStyle?? AppTextStyle.instance.blackSubTitle
                            .copyWith(
                                color: textColor ?? AppColor.white,
                                fontWeight: FontWeight.w700, fontSize: 16)),
                    SizedBox(
                      width: leadingWidget != null ? 40 : 5,
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Color _getButtonBackgroundColor(VoidCallback? onPressed) {
    return onPressed != null
        ? (backgroundColor ?? AppColor.primary)
        : Colors.grey;
  }
}
