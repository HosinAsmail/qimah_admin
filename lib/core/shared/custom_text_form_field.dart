import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final Alignment? alignment;

  final void Function()? onPressedIcon;
  final double? width;

  final double? height;
  final IconData? iconData;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;

  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;

  final bool? autoFocus;

  final TextStyle? textStyle;

  final String? label;
  final bool obscureText;
  final TextInputAction? textInputAction;

  final TextInputType? keyboardType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final TextStyle? labelStyle;
  final Widget? prefix;

  final FloatingLabelBehavior? floatingLabelBehavior;
  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final Color? iconColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final TextDirection? textDirection;

  const CustomTextFormField(
      {super.key,
      this.iconColor,
      this.alignment,
      this.onPressedIcon,
      this.width,
      this.height,
      this.scrollPadding,
      this.controller,
      this.focusNode,
      this.autoFocus = false,
      this.textStyle,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.hintStyle,
      this.floatingLabelBehavior,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.textAlignVertical,
      this.suffixConstraints,
      this.contentPadding,
      this.textDirection,
      this.label,
      this.labelStyle,
      this.obscureText = false,
      this.borderDecoration,
      this.fillColor,
      this.iconData,
      this.filled = true,
      this.validator});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool? obscureText;
  bool isShowingError = false;

  @override
  Widget build(BuildContext context) {
    obscureText = obscureText ?? widget.obscureText;

    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: textFormFieldWidget(context))
        : textFormFieldWidget(context);
  }

  InputDecoration decoration(context) => InputDecoration(
        label: widget.label == null ? null : Text(widget.label!),
        floatingLabelBehavior:
            widget.floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        labelStyle:
            widget.labelStyle ?? Theme.of(context).textTheme.labelMedium,
        floatingLabelStyle: const TextStyle(color: Colors.grey),
        hintText: widget.hintText ?? "",
        hintStyle: widget.hintStyle ?? Theme.of(context).textTheme.labelMedium,
        prefixIcon: widget.prefix,
        alignLabelWithHint: true,
        prefixIconConstraints: widget.prefixConstraints,
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
        suffixIconConstraints: widget.suffixConstraints,
        isDense: true,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 19,
            ),
        fillColor: widget.fillColor ?? AppColor.white,
        filled: widget.filled,
        border: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
        enabledBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
        focusedBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
      );

  Widget textFormFieldWidget(BuildContext context) => SizedBox(
        width: widget.width ?? double.maxFinite,
        height: widget.height,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(isShowingError ? 0 : 0.12),
                  spreadRadius: 5,
                  blurRadius: 8,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: TextFormField(
              textAlignVertical:
                  widget.textAlignVertical ?? TextAlignVertical.center,
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              controller: widget.controller,
              textDirection: widget.textDirection,
              focusNode: widget.focusNode,
              onTapOutside: (event) {
                if (widget.focusNode != null) {
                  widget.focusNode?.unfocus();
                } else {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              autofocus: widget.autoFocus!,
              style: widget.textStyle ?? Theme.of(context).textTheme.bodySmall,
              obscureText: obscureText!,
              textInputAction: widget.textInputAction,
              keyboardType: widget.keyboardType,
              maxLines: widget.maxLines ?? 1,
              decoration: decoration(context),
              onSaved: (value) {
                if (widget.validator!.call(value) != null &&
                    isShowingError == false) {
                  setState(() {
                    isShowingError = true;
                  });
                } else if (widget.validator!.call(value) == null &&
                    isShowingError == true) {
                  setState(() {
                    isShowingError = false;
                  });
                }
              },
              validator: widget.validator,
            ),
          ),
        ),
      );
}
