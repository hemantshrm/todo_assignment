import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/data/Utils/custom_widgets/custom_button.dart';
import 'package:todo_assignment/app/data/Utils/custom_widgets/custom_textField.dart';
import 'package:todo_assignment/app/data/Utils/space_util.dart';
import 'package:todo_assignment/app/data/Utils/text_extentions.dart';
import 'package:todo_assignment/app/data/Utils/validators.dart';

import '../../../../generated/assets.dart';
import '../../../data/Utils/math_util.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> with InputValidationMixin {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  Assets.imagesCreateAccount,
                  height: getSize(300),
                  width: getSize(300),
                ),
                CustomSpacers.height60,
                "Login".f24w5(fontWeight: FontWeight.bold, fontSize: 30.sp),
                CustomTextField(
                  initialValue: controller.loginPhoneNo.value,
                  action: TextInputAction.next,
                  labelText: "PHONE NUMBER",
                  max: 10,
                  type: TextInputType.phone,
                  validator: phoneNumberValidator,
                  onChanged: (value) => controller.onChangedPhone(value),
                  onSaved: (value) => controller.onSavedPhone(value),
                ),
                CustomSpacers.height20,
                CustomTextField(
                  obscure: true,
                  initialValue: controller.loginPass.value,
                  action: TextInputAction.done,
                  textCapitalization: TextCapitalization.words,
                  labelText: "PASSWORD",
                  validator: emptyField,
                  onChanged: (value) => controller.onChangedPass(value),
                  onSaved: (value) => controller.onSavedPass(value),
                ),
                CustomSpacers.height60,
                CustomButton(
                  onPressed: () => controller.onLogin(),
                  buttonText: "Login",
                )
              ],
            ).paddingAll(getHorizontalSize(20)),
          ),
        ),
      ),
    );
  }
}
