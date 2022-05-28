import 'package:flutter/material.dart';

import '../../Constants/colors_constants.dart';

class LoadingIndicator extends StatelessWidget {
  final bool show;
  const LoadingIndicator({Key? key, this.show = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: KColors.red));
  }
}
