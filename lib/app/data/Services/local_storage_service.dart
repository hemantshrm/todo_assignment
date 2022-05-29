import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_assignment/app/data/Constants/string_constants.dart';

class LocalStorageService extends GetxService {
  Future<LocalStorageService> init() async {
    box = GetStorage();
    await box.writeIfNull(THEME, false);
    Get.changeTheme(box.read(THEME) ? ThemeData.dark() : ThemeData.light());
    return this;
  }

  late GetStorage box;

  saveIsLoggedIn() async => await box.write(IS_LOGGED_IN, true);

  Future<bool> isLoggedIn() async => await box.read(IS_LOGGED_IN) ?? false;

  bool getTheme() => box.read(THEME);
  changeTheme(b) async {
    Get.changeTheme(b ? ThemeData.dark() : ThemeData.light());
    await box.write(THEME, b);
  }
}
