import 'package:flutter/material.dart';
import 'package:todo_assignment/app/data/Constants/colors_constants.dart';
import 'package:todo_assignment/generated/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 180.0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 20),
        title: const Text(
          'TODO',
          textScaleFactor: 2.1,
          style: TextStyle(color: KColors.persistentBlack),
        ),
        background: Image.asset(
          Assets.imagesBg,
          fit: BoxFit.fill,
        ),
      ),
      backgroundColor: KColors.persistentBlack,
      automaticallyImplyLeading: false,
    );
  }
}
