import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      this.label,
      this.iconData,
      this.maxLength,
      required this.controller,
      required this.validator,
      required this.keyboardType,
      this.obscureText = false,
      this.iconColor = AppColor.secondaryColor,
      this.onPressedIcon,
      this.textDirection,
      this.focusedBorderColor = AppColor.primaryColor,
      this.cursorColor = AppColor.primaryColor,
      this.autoFocus = false,
      this.onSaved});
  final String? hintText;
  final bool autoFocus;
  final String? label;
  final Color focusedBorderColor;
  final Color cursorColor;
  final Color iconColor;
  final int? maxLength;
  final IconData? iconData;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final void Function()? onPressedIcon;
  final bool obscureText;
  final void Function(String?)? onSaved;
  final TextDirection? textDirection;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    obscureText = obscureText ?? widget.obscureText;
    return TextFormField(
      maxLength: widget.maxLength,
      autofocus: widget.autoFocus,
      onSaved: widget.onSaved,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: obscureText!,
      cursorColor: widget.cursorColor,
      textDirection: widget.textDirection,
      decoration: InputDecoration(
          fillColor: AppColor.white,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 12,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: widget.label == null
              ? null
              : Container(
                  margin: const EdgeInsets.symmetric(horizontal: 9),
                  child: Text(
                    widget.label!,
                    style: const TextStyle(color: AppColor.black),
                  )),
          suffixIcon: widget.iconData == null
              ? null
              : IconButton(
                  onPressed: widget.onPressedIcon == null
                      ? null
                      : () {
                          setState(() {
                            obscureText = !obscureText!;
                          });
                        },
                  icon: Icon(
                    widget.iconData,
                    color: widget.iconColor,
                  )),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: widget.focusedBorderColor, width: 2)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
    );
  }
}
