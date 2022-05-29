import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/data/Constants/colors_constants.dart';
import 'package:todo_assignment/app/data/Utils/custom_widgets/custom_button.dart';
import 'package:todo_assignment/app/data/Utils/math_util.dart';
import 'package:todo_assignment/app/data/Utils/space_util.dart';
import 'package:todo_assignment/app/data/Utils/text_extentions.dart';
import 'package:todo_assignment/app/routes/app_pages.dart';
import 'package:todo_assignment/generated/assets.dart';

import '../controllers/create_account_controller.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Welcome".f24w5(fontWeight: FontWeight.bold, fontSize: 30.sp),
            const Spacer(),
            SvgPicture.asset(
              Assets.imagesCreateAccount,
              height: getSize(300),
              width: getSize(300),
            ),
            const Spacer(),
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                .f16w6(),
            CustomSpacers.height60,
            CustomButton(
              onPressed: () => Get.toNamed(Routes.LOGIN),
              buttonText: 'Login',
            ),
            CustomSpacers.height20,
            CustomButton(
              onPressed: () => Get.toNamed(Routes.SIGNUP),
              buttonColor: KColors.persistentBlack,
              textColor: KColors.white,
              buttonText: 'SignUp',
            )
          ],
        ).paddingAll(getHorizontalSize(20)),
      ),
    );
  }
}
