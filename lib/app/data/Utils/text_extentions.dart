import 'package:flutter/material.dart';
import 'package:todo_assignment/app/data/Constants/colors_constants.dart';

import '../Constants/textStyle_constants.dart';

extension ExtendedString on String {
  static const strFontFamily = "CarmenSans";

  Text f16w6(
          {Color? textColor = KColors.white,
          TextAlign? textAlign = TextAlign.start,
          int? maxLines,
          FontWeight? fontWeight,
          double? fontSize,
          TextOverflow? overflow}) =>
      Text(this,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: KTextStyle.f16w6.copyWith(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: strFontFamily));
}
