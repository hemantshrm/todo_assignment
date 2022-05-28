import 'package:get/get.dart';

import '../Constants/string_constants.dart';

mixin InputValidationMixin {
  String? descriptionValidator(String? value) {
    if (value!.isEmpty) {
      return errorEnterDescription;
    } else if (value.length < 6) {
      return errorMinDescription;
    } else {
      return null;
    }
  }

  String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return errorEnterPassword;
    } else if (password.length < 6) {
      return errorPasswordMinLength;
    } else if (password.length > 15) {
      return errorPasswordMaxLength;
    } else {
      return null;
    }
  }

  String? emptyTitle(String? value) {
    if (value!.isEmpty) {
      return errorEmpty;
    } else {
      return null;
    }
  }

  String? emptyCategory(String? value) {
    if (value!.isEmpty) {
      return errorEmpty;
    } else {
      return null;
    }
  }

  String? userNameValidator(String? userName) {
    if (userName!.isEmpty) {
      return errorEmpty;
    } else if (!GetUtils.isUsername(userName)) {
      return errorEnterName;
    }
    return null;
  }

  String? phoneNumberValidator(String number) {
    const String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    final RegExp regExp = RegExp(pattern);
    if (number.isEmpty) {
      return errorEnterNumber;
    } else if (number.length < 10) {
      return errorEnterValidNumber;
    } else if (number.length > 10) {
      return errorEnterValidNumber;
    } else if (!regExp.hasMatch(number)) {
      return errorEnterValidNumber;
    }
    return null;
  }
}
