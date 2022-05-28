import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/colors_constants.dart';
import '../Constants/textStyle_constants.dart';

ThemeData customTheme = ThemeData(
    fontFamily: 'CarmenSans',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: KColors.background,
    scrollbarTheme: ScrollbarThemeData(
      interactive: true,
      radius: const Radius.circular(16.0),
      thumbColor: MaterialStateProperty.all(KColors.white),
      thickness: MaterialStateProperty.all(5.0),
      minThumbLength: 100,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle:
          KTextStyle.f16w5.copyWith(fontFamily: 'CarmenSans', fontSize: 18.sp),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white, size: 26),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusColor: KColors.purple,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: KColors.red,
          width: 1,
        ),
      ),
    ),
    indicatorColor: KColors.red,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: KColors.purple));
