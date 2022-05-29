import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_assignment/app/data/Utils/math_util.dart';
import 'package:todo_assignment/app/data/Utils/space_util.dart';
import 'package:todo_assignment/app/data/Utils/text_extentions.dart';
import 'package:todo_assignment/generated/assets.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset(
        Assets.imagesEmpty,
        height: getSize(200),
        width: getSize(200),
      ),
      CustomSpacers.height20,
      "No Todo".f24w5()
    ]);
  }
}
