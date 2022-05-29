import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/data/Constants/colors_constants.dart';
import 'package:todo_assignment/app/data/Utils/custom_widgets/show_messages.dart';
import 'package:todo_assignment/app/modules/home/controllers/home_controller.dart';
import 'package:todo_assignment/app/routes/app_pages.dart';

import '../../Constants/string_constants.dart';

class CustomAppBar extends GetView<HomeController> {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 10,
      forceElevated: true,
      pinned: true,
      scrolledUnderElevation: 0,
      expandedHeight: 180.0,
      actions: [
        IconButton(
            onPressed: () async {
              await controller.appConfigService.box.remove(ANNOTATIONS);
              await controller.appConfigService.box.remove(IS_LOGGED_IN);

              Get.offNamed(Routes.CREATE_ACCOUNT);
              customSnackbar("Logout Successful", isError: false);
            },
            icon: const Icon(Icons.logout, color: KColors.white))
      ],
      flexibleSpace: const FlexibleSpaceBar(
        expandedTitleScale: 2,
        titlePadding: EdgeInsets.only(left: 20, bottom: 14),
        title: Text(
          'TODO',
          textScaleFactor: 1.2,
          style: TextStyle(color: KColors.white, fontFamily: "CarmenSans"),
        ),
      ),
      backgroundColor: KColors.persistentBlack,
      automaticallyImplyLeading: false,
    );
  }
}
