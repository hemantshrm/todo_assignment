import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_assignment/app/data/Utils/text_extentions.dart';

import '../../Constants/colors_constants.dart';
import '../math_util.dart';

class CustomButton extends StatelessWidget {
  final String? icon;
  final VoidCallback onPressed;
  final String? buttonText;
  final Color? buttonColor;
  final FontWeight? fontWeight;
  final Color? textColor, borderColor;
  final double? fontSize;

  const CustomButton(
      {Key? key,
      required this.onPressed,
      this.buttonText,
      this.icon,
      this.buttonColor = KColors.red,
      this.borderColor = Colors.transparent,
      this.fontWeight = FontWeight.w700,
      this.textColor = KColors.white,
      this.fontSize = 16})
      : super(key: key);

  factory CustomButton.icon(String icon, VoidCallback onPressed,
      {buttonText, buttonColor, textColor}) {
    return CustomButton(
      icon: icon,
      onPressed: onPressed,
      buttonText: buttonText,
      buttonColor: buttonColor,
      textColor: textColor,
    );
  }

  factory CustomButton.text(
    String buttonText,
    VoidCallback onPressed, {
    Color? borderColor = Colors.transparent,
    Color? buttonColor = KColors.red,
    FontWeight? fontWeight = FontWeight.w700,
    Color? textColor = KColors.white,
    double? fontSize = 16,
  }) {
    return CustomButton(
      buttonText: buttonText,
      onPressed: onPressed,
      borderColor: borderColor,
      buttonColor: buttonColor,
      textColor: textColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 0,
        enableFeedback: true,
        shape: StadiumBorder(side: BorderSide(color: borderColor!)),
        minWidth: double.infinity,
        height: getVerticalSize(57),
        onPressed: onPressed,
        color: buttonColor,
        child: icon != null
            ? Wrap(
                spacing: 10,
                children: [
                  SvgPicture.asset(
                    icon!,
                    fit: BoxFit.contain,
                    height: getVerticalSize(23),
                  ),
                  buttonText!.f16w6(
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      textColor: textColor,
                      textAlign: TextAlign.center)
                ],
              )
            : buttonText!.f16w6(
                fontSize: fontSize,
                fontWeight: fontWeight,
                textColor: textColor,
                textAlign: TextAlign.center));
  }
}
