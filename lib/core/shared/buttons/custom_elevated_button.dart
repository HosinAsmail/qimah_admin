import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  const CustomElevatedButton(
      {super.key,
      this.decoration,
      this.leftIcon,
      this.rightIcon,
      super.margin,
      super.onPressed,
      super.buttonStyle,
      super.alignment,
      super.buttonTextStyle,
      super.isDisabled,
      super.height,
      super.width,
      required super.text});

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget(context))
        : buildElevatedButtonWidget(context);
  }

  Widget buildElevatedButtonWidget(context) => Container(
        height: height ?? 60,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ??
                    Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: AppColor.secondaryColor,
                        fontWeight: FontWeight.bold),
              ),
              rightIcon ?? const SizedBox.shrink()
            ],
          ),
        ),
      );
}
