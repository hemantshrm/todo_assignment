import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_assignment/app/data/Constants/string_constants.dart';
import 'package:todo_assignment/app/routes/app_pages.dart';

class AuthMiddleWare extends GetMiddleware {
  final box = GetStorage();

  @override
  RouteSettings? redirect(String? route) {
    return box.read(IS_LOGGED_IN) ?? false
        ? const RouteSettings(name: Routes.HOME)
        : null;
  }
}
