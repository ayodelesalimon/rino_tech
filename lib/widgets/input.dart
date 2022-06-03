// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String? hintText;
  //final String Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;

  final TextInputType? keyboard;
  final String? init;
  final bool isPassword;
  final Color? isPasswordColor;
  //final bool showObscureText;
  final bool obscureText;
  final Color? styleColor;
  final Color? hintStyleColor;
  final bool enable;
  final String? labelText;
  final String? errorText;
  final dynamic maxLines;
  final Color? borderColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? labelColor;
  final String? inputIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Key? key;
  final TextEditingController? controller;
  //final List<TextInputFormatter> inputFormatters;
  final FocusNode? focusNode;
  //final bool alignLabelWithHint;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Function onTap;
  final double? borderRadius;
  Input(
      {this.hintText,
      this.labelColor,
      this.fillColor,
      this.textColor,
      this.borderRadius,
      // required this.validator,
      this.hintColor,
      required this.onSaved,
     
      this.init,
      this.isPassword = false,
      this.isPasswordColor,
      //this.showObscureText,
      this.obscureText = false,
      this.keyboard,
      this.styleColor,
      this.hintStyleColor,
      this.enable = true,
      this.labelText,
      this.maxLines = 1,
      this.borderColor = Colors.grey,
      required this.onChanged,
      this.prefix,
      this.suffix,
      this.key,
      this.controller,
      this.focusNode,

      ///this.alignLabelWithHint,
      this.floatingLabelBehavior,
      required this.onTap,
      this.errorText,
      this.inputIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      controller: controller,
      key: key,
      enabled: enable,
      onSaved: onSaved!,
      onChanged: onChanged!,
      obscureText: obscureText,
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        suffixIcon: suffix,
        fillColor: !enable
            ? fillColor ?? Color(0xFFeeeeee)
            : fillColor ?? Colors.white,
        // fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintStyleColor ?? Colors.grey,
          fontSize: 14,
        ),
      ),
    );
  }
}

enum KeyboardType { NUMBER, TEXT, EMAIL, PHONE }
