import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/data/Constants/string_constants.dart';
import 'package:todo_assignment/app/data/Services/local_storage_service.dart';

class SignupController extends GetxController {
  late LocalStorageService localStorage;
  final phoneNumber = ''.obs;
  final password = ''.obs;
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    localStorage = Get.find<LocalStorageService>();
    super.onInit();
  }

  onSavedPhone(v) => phoneNumber.value = v;
  onChangedPhone(v) => phoneNumber.value = v;
  onSavedPass(v) => password.value = v;
  onChangedPass(v) => password.value = v;

  onSignUp() {
    if (signUpFormKey.currentState!.validate()) {
      localStorage.box.write(USERS, "value");
    }
  }
}
