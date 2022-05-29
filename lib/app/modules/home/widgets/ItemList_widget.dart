import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/data/Constants/colors_constants.dart';
import 'package:todo_assignment/app/data/Utils/space_util.dart';
import 'package:todo_assignment/app/data/Utils/text_extentions.dart';

import '../../../data/Utils/custom_widgets/show_messages.dart';
import '../controllers/home_controller.dart';

class ItemListWidget extends GetView<HomeController> {
  final int index;
  const ItemListWidget(this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              border: Border.all(color: KColors.persistentBlack),
              borderRadius: BorderRadius.circular(50)),
          child: controller
              .annotations.value.annotations![index].value.category!
              .f16w6(
                  overflow: TextOverflow.ellipsis,
                  textColor: KColors.neruColor),
        ),
        Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {
                controller.removeAnotation(index);
                customSnackbar("Removed", isError: false);
              }),
              children: [
                SlidableAction(
                  onPressed: (_) => controller.openEdit(index),
                  backgroundColor: const Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
                SlidableAction(
                  onPressed: (_) {
                    controller.removeAnotation(index);
                    customSnackbar("Removed", isError: false);
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ]),
          child: ListTile(
            onTap: () async => await controller.checkAnnotation(index),
            dense: false,
            isThreeLine: true,
            title: controller.annotations.value.annotations![index].value.title!
                .f16w6(
                    overflow: TextOverflow.ellipsis,
                    textColor: KColors.neruColor2),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                controller
                    .annotations.value.annotations![index].value.description!
                    .f14w4(fontWeight: FontWeight.w500),
                CustomSpacers.height6,
                Text(
                  controller.annotations.value.annotations![index].value.date!,
                ),
              ],
            ),
            trailing: Transform.scale(
              scale: 1.2,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                fillColor: MaterialStateProperty.all(KColors.green),
                checkColor: Colors.white,
                value: controller
                    .annotations.value.annotations![index].value.check!,
                shape: const CircleBorder(),
                onChanged: (bool? value) async {
                  await controller.checkAnnotation(index);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
