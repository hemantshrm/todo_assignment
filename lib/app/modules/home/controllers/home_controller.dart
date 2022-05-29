import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/Constants/string_constants.dart';
import '../../../data/ModelClasses/todo_model.dart';
import '../../../data/Services/local_storage_service.dart';
import '../widgets/bottom_sheet.dart';

class HomeController extends GetxController {
  late LocalStorageService appConfigService;
  Rx<Annotations> annotations = Annotations().obs;
  final GlobalKey<FormState> addTodoFormKey = GlobalKey<FormState>();
  final message = ''.obs;
  final title = ''.obs;
  final description = ''.obs;
  final category = ''.obs;
  final edit = false.obs;
  final load = false.obs;
  @override
  void onInit() {
    appConfigService = Get.find<LocalStorageService>();
    getAnnotations();
    super.onInit();
  }

  RxList<Rx<TodoModel>> todoList(res) =>
      RxList<Rx<TodoModel>>.from(res.map((x) => TodoModel.fromJson(x).obs));

  /// GET TO_DOs
  getAnnotations() async {
    Map ans = await appConfigService.box.read(ANNOTATIONS);
    annotations.value.annotations = todoList(ans[ANNOTATIONS]);
  }

  /// REMOVE TO_DO
  removeAnotation(index) async {
    annotations.value.annotations?.removeAt(index);
    Get.forceAppUpdate();
    await appConfigService.box.write(ANNOTATIONS, annotations);
  }

  openEdit(index) {
    if (kDebugMode) {
      print(index.toString());
    }
    edit.value = true;
    title.value = annotations.value.annotations![index].value.title!;
    category.value = annotations.value.annotations![index].value.category!;
    description.value =
        annotations.value.annotations![index].value.description!;
    Get.bottomSheet(BottomSheetAnnotation(index: index));
  }

  /// OPENING ADD TO_DO [BOTTOM SHEET]
  openAdd() {
    title.value = '';
    description.value = '';
    category.value = '';
    edit.value = false;
    Get.bottomSheet(BottomSheetAnnotation());
  }

  /// FOr EDIT
  editAnnotation(index) async {
    annotations.value.annotations![index].value.description = description.value;
    annotations.value.annotations![index].value.title = title.value;
    Get.forceAppUpdate();
    await appConfigService.box.write(ANNOTATIONS, annotations);
    message.value = "Edited";
    edit.value = false;
    Get.back();
  }

  /// FOR CHECK
  checkAnnotation(index) async {
    annotations.value.annotations![index].value.check =
        !annotations.value.annotations![index].value.check!;
    Get.forceAppUpdate();
    await appConfigService.box.write(ANNOTATIONS, annotations);
  }

  /// FOR ADD NEW TO_DO
  RxList<Rx<TodoModel>> a = RxList<Rx<TodoModel>>();

  addAnnotation() async {
    final now = DateTime.now();
    a.add(TodoModel(
            check: false,
            date:
                '${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}',
            description: description.value,
            category: category.value,
            title: title.value)
        .obs);
    message.value = "Todo Added Successfully";
    if (annotations.value.annotations?.length == null) {
      annotations.value.annotations = RxList<Rx<TodoModel>>();
    } else {
      annotations.value.annotations?.insert(0, a.last);
      Get.back();
    }
    await appConfigService.box.write(ANNOTATIONS, annotations);
    title.value = '';
    description.value = '';
    category.value = '';
  }

  onSavedTitle(v) => title.value = v;
  onChangedTitle(v) => title.value = v;
  onSavedDescription(v) => description.value = v;
  onChangedDescription(v) => description.value = v;
  onSavedCategory(v) => category.value = v;
  onChangedCategory(v) => category.value = v;
}
