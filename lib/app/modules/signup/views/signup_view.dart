import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/data/Utils/custom_widgets/custom_button.dart';
import 'package:todo_assignment/app/data/Utils/custom_widgets/custom_textField.dart';
import 'package:todo_assignment/app/data/Utils/space_util.dart';
import 'package:todo_assignment/app/data/Utils/text_extentions.dart';
import 'package:todo_assignment/app/data/Utils/validators.dart';

import '../../../data/Utils/math_util.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> with InputValidationMixin {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.signUpFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "SignUp".f24w5(fontWeight: FontWeight.bold, fontSize: 30.sp),
              CustomTextField(
                initialValue: controller.phoneNumber.value,
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
                initialValue: controller.password.value,
                action: TextInputAction.done,
                textCapitalization: TextCapitalization.words,
                labelText: "PASSWORD",
                validator: passwordValidator,
                onChanged: (value) => controller.onChangedPass(value),
                onSaved: (value) => controller.onSavedPass(value),
              ),
              CustomSpacers.height60,
              CustomButton(
                onPressed: () => controller.onSignUp(),
                buttonText: "Sign Up",
              )
            ],
          ).paddingAll(getHorizontalSize(20)),
        ),
      ),
    );
  }
}
