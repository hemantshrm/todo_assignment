import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_assignment/app/data/Constants/colors_constants.dart';
import 'package:todo_assignment/app/data/Constants/textStyle_constants.dart';

class CustomTextField extends StatelessWidget {
  final Function(String value)? onSaved;
  final Function(String value)? onChanged;
  final Function(String value)? validator;
  final bool? emailCheck;
  final String? labelText;
  final Widget? sufixIcon;
  final Widget? prefixIcon;
  final TextInputAction? action;
  final TextInputType? type;
  final bool obscure;
  final TextEditingController? controller;
  final TextDirection? direction;
  final int? max;
  final List<TextInputFormatter>? formatter;
  final int? maxLines;
  final String? initialValue;
  final String? hintText;
  final TextCapitalization? textCapitalization;
  const CustomTextField(
      {Key? key,
      this.maxLines = 1,
      this.initialValue,
      this.emailCheck,
      this.labelText,
      this.formatter,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.sufixIcon,
      this.action,
      this.type,
      this.obscure = false,
      this.controller,
      this.direction = TextDirection.ltr,
      this.max,
      this.prefixIcon,
      this.hintText,
      this.textCapitalization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: formatter,
      maxLines: maxLines,
      initialValue: initialValue,
      maxLength: max,
      textDirection: direction,
      controller: controller,
      obscureText: obscure,
      style: KTextStyle.f18w6.copyWith(color: KColors.white),
      keyboardType: type,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      cursorColor: KColors.persistentBlack,
      decoration: InputDecoration(
          labelStyle: KTextStyle.f16w6.copyWith(color: KColors.persistentBlack),
          focusColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          //contentPadding: EdgeInsets.only(top: 5),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: KColors.persistentBlack,
          )),
          labelText: labelText,
          suffixIcon: sufixIcon,
          prefixIcon: prefixIcon),
      onChanged: (value) => onChanged!(value),
      onSaved: (value) => onSaved!(value!),
      validator: (value) => validator!(value!),
      textInputAction: action,
    );
  }
}
