import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:todo_assignment/app/data/Constants/colors_constants.dart';
import 'package:todo_assignment/app/data/Utils/text_extentions.dart';

import '../controllers/home_controller.dart';
import 'add_task.dart';

class BottomSheetAnnotation extends Container {
  final controller = Get.find<HomeController>();
  final int? index;
  BottomSheetAnnotation({Key? key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GlassmorphicContainer(
          width: Get.width,
          height: Get.height / 2,
          borderRadius: 10,
          blur: 10,
          alignment: Alignment.bottomCenter,
          border: 2,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.1),
                const Color(0xFFFFFFFF).withOpacity(0.05),
              ],
              stops: const [
                0.1,
                1,
              ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.5),
              Colors.black.withOpacity(0.6),
            ],
          ),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: "Add TODO".f18w6(textColor: KColors.white)),
              AddAnnotationForm(
                index: index,
              )
            ],
          )),
    );
  }
}
