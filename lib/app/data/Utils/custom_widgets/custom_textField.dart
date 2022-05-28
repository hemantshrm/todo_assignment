import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_assignment/app/data/Constants/colors_constants.dart';
import 'package:todo_assignment/app/data/Constants/textStyle_constants.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
      required this.controller,
      this.inputType = TextInputType.text,
      this.label,
      this.maxLength = 18,
      this.readOnly = false,
      this.isObscureText = false,
      this.validator,
      this.onTapAction,
      this.inputFormator,
      this.trailing,
      this.autovalidateMode = AutovalidateMode.onUserInteraction})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType? inputType;
  final String? label;
  final bool readOnly, isObscureText;
  final Widget? trailing;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormator;
  final AutovalidateMode? autovalidateMode;
  final VoidCallback? onTapAction;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: KColors.red,
        cursorHeight: 20,
        onTap: onTapAction,
        keyboardType: inputType!,
        obscureText: isObscureText,
        controller: controller,
        maxLines: 1,
        readOnly: readOnly,
        inputFormatters: inputFormator,
        validator: validator,
        style: KTextStyle.f18w6.copyWith(color: KColors.red),
        maxLength: maxLength!,
        decoration: InputDecoration(
            suffixIconConstraints: const BoxConstraints(
              minWidth: 10,
              minHeight: 10,
            ),
            counterText: '',
            suffixIcon: trailing,
            suffixIconColor: KColors.red,
            hintText: label,
            isDense: true,
            hintStyle:
                KTextStyle.f14w4.copyWith(color: const Color(0xff90A4AE)),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: KColors.red))));
  }
}
