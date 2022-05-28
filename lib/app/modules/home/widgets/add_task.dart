import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/data/Utils/custom_widgets/custom_button.dart';
import 'package:todo_assignment/app/data/Utils/custom_widgets/custom_textField.dart';
import 'package:todo_assignment/app/data/Utils/custom_widgets/loader.dart';
import 'package:todo_assignment/app/data/Utils/custom_widgets/show_messages.dart';
import 'package:todo_assignment/app/data/Utils/validators.dart';

import '../controllers/home_controller.dart';

class AddAnnotationForm extends GetView<HomeController>
    with InputValidationMixin {
  final bool edit;
  final int? index;
  const AddAnnotationForm({Key? key, this.edit = false, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Form(
        key: controller.addTodoFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            CustomTextField(
              initialValue: controller.category.value,
              action: TextInputAction.next,
              textCapitalization: TextCapitalization.characters,
              labelText: "Category",
              validator: (value) => emptyCategory(value),
              onChanged: (value) => controller.onChangedCategory(value),
              onSaved: (value) => controller.onSavedCategory(value),
            ),
            CustomTextField(
              initialValue: controller.title.value,
              action: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              labelText: "Title",
              validator: (value) => emptyTitle(value),
              onChanged: (value) => controller.onChangedTitle(value),
              onSaved: (value) => controller.onSavedTitle(value),
            ),
            CustomTextField(
              initialValue: controller.description.value,
              maxLines: 4,
              labelText: "Description",
              textCapitalization: TextCapitalization.words,
              validator: (value) => descriptionValidator(value),
              onChanged: (value) => controller.onChangedDescription(value),
              onSaved: (value) => controller.onSavedDescription(value),
              action: TextInputAction.done,
            ),
            Obx(() => controller.load.value
                ? const LoadingIndicator()
                : Container(
                    width: 160.0,
                    padding: const EdgeInsets.only(top: 24.0),
                    child: CustomButton(
                        onPressed: () async {
                          if (controller.addTodoFormKey.currentState!
                              .validate()) {
                            controller.addTodoFormKey.currentState!.save();
                            controller.edit.value
                                ? await controller.editAnnotation(index)
                                : await controller.addAnnotation();
                            customSnackbar(controller.message.value,
                                isError: false);
                          }
                        },
                        buttonText: controller.edit.value ? "EDIT" : "ADD"),
                  ))
          ],
        ),
      ),
    );
  }
}
