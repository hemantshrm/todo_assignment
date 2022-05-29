import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/data/Constants/string_constants.dart';
import 'package:todo_assignment/app/data/Services/local_storage_service.dart';
import 'package:todo_assignment/app/data/Utils/custom_widgets/show_messages.dart';
import 'package:todo_assignment/app/routes/app_pages.dart';

import '../../../data/ModelClasses/user_model.dart';

class LoginController extends GetxController {
  late LocalStorageService localStorage;

  var userList = List<User>.empty(growable: true).obs;
  final loginPhoneNo = ''.obs;
  final loginPass = ''.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    localStorage = Get.find<LocalStorageService>();
    getUserList();
    super.onInit();
  }

  getUserList() async {
    final user = await localStorage.box.read(USERS);
    print(user);
    if (user != null) {
      userList.value = user;
    }
  }

  onSavedPhone(v) => loginPhoneNo.value = v;
  onChangedPhone(v) => loginPhoneNo.value = v;
  onSavedPass(v) => loginPass.value = v;
  onChangedPass(v) => loginPass.value = v;

  onLogin() async {
    if (loginFormKey.currentState!.validate()) {
      //  final userList = await localStorage.box.read(USERS);
      if (userList.isNotEmpty) {
        for (var element in userList) {
          if (element.phone == loginPhoneNo.value &&
              element.pass == loginPass.value) {
            Get.offNamed(Routes.HOME);
            localStorage.saveIsLoggedIn();
          } else if (element.pass != loginPass.value) {
            customSnackbar("Incorrect Password", isError: true);
          } else {
            customSnackbar("Sorry, User Not found", isError: true);
          }
        }
      } else {
        customSnackbar('No User Found, Please Register First', isError: true);
      }
    }
  }
}
