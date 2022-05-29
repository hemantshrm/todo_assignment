import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/data/Constants/string_constants.dart';
import 'package:todo_assignment/app/data/ModelClasses/user_model.dart';
import 'package:todo_assignment/app/data/Services/local_storage_service.dart';
import 'package:todo_assignment/app/data/Utils/custom_widgets/show_messages.dart';
import 'package:todo_assignment/app/routes/app_pages.dart';

class SignupController extends GetxController {
  late LocalStorageService localStorage;
  var userList = List<User>.empty(growable: true);
  //final userList = RxList<Rx<User>>();
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

  onSignUp() async {
    if (signUpFormKey.currentState!.validate()) {
      userList.add(User(phone: phoneNumber.value, pass: password.value));

      await localStorage.box.write(USERS, userList); // Saving User
      await localStorage.saveIsLoggedIn();

      customSnackbar('Registration Successful', isError: false);
      Get.offAndToNamed(Routes.HOME);
    }
  }
}
