import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proarea_assignment/ui/home/widget/app_button.dart';

import '../../../utils/image_path.dart';

class AppError extends StatelessWidget {
  final void Function() onPressed;
  final String message;

  const AppError({super.key, required this.message, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SvgPicture.asset(ImagesAsset.errorImg),
        AppButton(
          text: message,
          onPressed: onPressed,
        )
      ],
    ));
  }
}
