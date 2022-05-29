import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/Utils/custom_widgets/custom_appBar.dart';
import '../../../data/Utils/empty_wdget.dart';
import '../controllers/home_controller.dart';
import '../widgets/Fab_button.dart';
import '../widgets/ItemList_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const CustomAppBar(),
            SliverFillRemaining(
              child: Obx(() =>
                  controller.annotations.value.annotations?.isEmpty ?? true
                      ? const EmptyWidget()
                      : Obx(() => ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              controller.annotations.value.annotations!.length,
                          itemBuilder: (_, index) => ItemListWidget(index),
                          separatorBuilder: (_, __) => const Divider()))),
            ),
          ],
        ),
        floatingActionButton: const FabWidget());
  }
}
