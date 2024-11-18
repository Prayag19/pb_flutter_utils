import 'dart:ui';
import 'package:flutter/material.dart';
import '../screen/colors.dart';

class InputField extends StatefulWidget {
  final double? height;
  final EdgeInsets? insetPadding;
  final String? hint;
  final int? maxCharacter;
  final bool isEnabled;
  InputFieldState fieldState;
  final bool showHintAsLabel;
  final bool isReadOnly;
  final bool passField;
  final int? maxLines;
  final Color? borColor;
  final BoxDecoration? decoration;
  final TextInputType? textInputType;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Function(String, InputFieldState)? onChanged;
  final Function(String)? onSubmit;
  final VoidCallback? onTap;

  InputField({
    this.height,
    this.hint,
    this.decoration,
    this.textStyle,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.hintStyle,
    this.prefixWidget,
    this.suffixWidget,
    this.textInputType,
    this.onChanged,
    this.onSubmit,
    required this.fieldState,
    this.maxCharacter,
    this.borColor,
    this.showHintAsLabel = false,
    this.maxLines,
    this.passField = false,
    this.insetPadding,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isInFocus = false;

  @override
  void initState() {
    super.initState();
    widget.fieldState.node?.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    widget.fieldState.node?.removeListener(_onFocusChange);
    // widget.fieldState.node?.dispose();
  }

  void _onFocusChange() {
    isInFocus = widget.fieldState.node!.hasFocus;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Container(
        height: widget.height,
        constraints: BoxConstraints(
          maxWidth: 500
        ),
        child: Padding(
          padding: widget.insetPadding ?? EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                focusNode: widget.fieldState.node,
                enabled: widget.isEnabled,
                style: widget.textStyle ??
                    const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                controller: widget.fieldState.textEditingController,
                keyboardType: widget.textInputType,
                maxLength: widget.maxCharacter,
                maxLines: widget.maxLines ?? 1,
                obscureText: widget.passField,
                onChanged: (s) {
                  widget.fieldState.isError = false;
                  widget.fieldState.errorMsg = "";
                  widget.onChanged?.call(s, widget.fieldState);

                  setState(() {});
                },
                onFieldSubmitted: (s) {
                  widget.onSubmit?.call(s);
                },
                readOnly: widget.isReadOnly,
                decoration: InputDecoration(
                  prefixIcon: widget.prefixWidget,
                  suffixIcon: widget.suffixWidget,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        width: 1,
                        color: widget.fieldState.isError == true
                            ? Colors.red
                            : (widget.borColor ?? AppColor.primary)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  label: widget.showHintAsLabel == true
                      ? Text(
                          widget.hint ?? "",
                          style: widget.hintStyle ??
                              TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: isInFocus
                                      ? AppColor.primary
                                      : AppColor.blackText),
                        )
                      : null,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        width: 1,
                        color: widget.fieldState.isError == true
                            ? Colors.red
                            : widget.borColor ?? AppColor.blackText),
                  ),
                  hintText: widget.hint,
                  counterText: "",
                  border: InputBorder.none,
                  hintStyle: widget.hintStyle ??
                      TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: isInFocus
                              ? AppColor.primary
                              : AppColor.blackText),
                ),
              ),
              SizedBox(
                height: widget.fieldState.isError == true ? 5 : 0,
              ),
              widget.fieldState.isError == true
                  ? Padding(
                      padding: EdgeInsets.only(top: 5.0, left: 5),
                      child: Text(
                        widget.fieldState.errorMsg ?? "",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ))
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

class InputFieldState {
  String? errorMsg;
  bool? isError;
  FocusNode? node;
  TextEditingController? textEditingController;

  InputFieldState(String? initialValue, bool? isErrorX, String? errorMSgX,
      {
    FocusNode? node,
  }) {
    textEditingController = TextEditingController(text: initialValue);
    errorMsg = errorMSgX ?? "";
    node = node??FocusNode();
    isError = isErrorX ?? false;
  }
}
