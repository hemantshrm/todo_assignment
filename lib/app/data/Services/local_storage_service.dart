import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_assignment/app/data/Constants/string_constants.dart';

class LocalStorage {
  static final GetStorage localBox = GetStorage();
  static final LocalStorage _singleton = LocalStorage._internal();
  factory LocalStorage() => _singleton;
  LocalStorage._internal();
  static LocalStorage get shared => _singleton;

  // void saveUserData(LoginModel userData) async {
  //   localBox.write("USER_DATA", loginModelToJson(userData));
  // }
  //
  // LoginModel? getUserData() {
  //   LoginModel? userData;
  //   final String? _user = localBox.read("USER_DATA");
  //   if (_user != null) {
  //     userData = LoginModel.fromJson(json.decode(_user));
  //     return userData;
  //   }
  //   return null;
  // }

  void saveLoggedIn() {
    localBox.write("IS_LOGGED_IN", true);
  }

  bool isLoggedIn() {
    return localBox.read("IS_LOGGED_IN") ?? false;
  }

  Future<void> reset() async {
    localBox.erase();
  }
}

class AppConfigService extends GetxService {
  Future<AppConfigService> init() async {
    box = GetStorage();
    await box.writeIfNull(THEME, false);
    Get.changeTheme(box.read(THEME) ? ThemeData.dark() : ThemeData.light());
    return this;
  }

  late GetStorage box;
  bool getTheme() => box.read(THEME);
  changeTheme(b) async {
    Get.changeTheme(b ? ThemeData.dark() : ThemeData.light());
    await box.write(THEME, b);
  }
}
