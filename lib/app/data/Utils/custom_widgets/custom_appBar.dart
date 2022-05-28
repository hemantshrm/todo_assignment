import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/data/Constants/colors_constants.dart';
import 'package:todo_assignment/app/data/Constants/string_constants.dart';
import 'package:todo_assignment/app/data/Utils/custom_widgets/show_messages.dart';
import 'package:todo_assignment/app/modules/home/controllers/home_controller.dart';
import 'package:todo_assignment/app/routes/app_pages.dart';

class CustomAppBar extends GetView<HomeController> {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 180.0,
      actions: [
        IconButton(
            onPressed: () {
              controller.appConfigService.box.remove(ANNOTATIONS);
              Get.offAndToNamed(Routes.CREATE_ACCOUNT);
              customSnackbar("Logout Successful", isError: false);
            },
            icon: const Icon(Icons.logout, color: KColors.white))
      ],
      flexibleSpace: const FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 20),
        title: Text(
          'TODO',
          textScaleFactor: 1.7,
          style: TextStyle(color: KColors.white, fontFamily: "CarmenSans"),
        ),
      ),
      backgroundColor: KColors.persistentBlack,
      automaticallyImplyLeading: false,
    );
  }
}
