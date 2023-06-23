import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class AppDivider extends StatelessWidget {
  final Color? color;

  const AppDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.0,
      color: color ?? AppColor.PRIMARY_500,
      thickness: 1.0,
    );
  }
}
