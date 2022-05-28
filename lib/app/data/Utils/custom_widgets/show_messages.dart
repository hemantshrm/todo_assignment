import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/colors_constants.dart';

SnackbarController customSnackbar(String msg,
    {Color? color, required bool isError}) {
  return Get.rawSnackbar(
    message: msg,
    borderRadius: 20,
    margin: const EdgeInsets.symmetric(
        horizontal: 20, vertical: kBottomNavigationBarHeight + 10),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(milliseconds: 1500),
    borderColor: color ?? KColors.white,
    icon: Icon(isError ? Icons.dangerous : Icons.done, color: Colors.white),
    snackPosition: SnackPosition.TOP,
    backgroundColor: KColors.persistentBlack,
  );
}

void showCongratsDialog() async {
  await showDialog<String>(
    context: Get.context!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
        content: Text(''),
      );
    },
  );
}
