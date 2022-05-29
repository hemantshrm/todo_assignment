import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/data/Constants/colors_constants.dart';
import 'package:todo_assignment/app/modules/home/controllers/home_controller.dart';

class FabWidget extends GetView<HomeController> {
  const FabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: KColors.persistentBlack,
        onPressed: () => controller.openAdd(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ));
  }
}
