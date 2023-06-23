import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final IconData? iconButton;
  final Color? textColor;
  final Color? buttonColor;
  final double? borderRadius;
  final double? buttonHeight;
  final double? buttonWidth;

  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.iconButton,
    this.textColor,
    this.borderRadius,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    final hasIconButton = iconButton != null;
    final buttonStyle = ElevatedButton.styleFrom(
      foregroundColor: textColor ?? AppColor.LM_BACKGROUND_BASIC,
      backgroundColor: buttonColor ?? AppColor.PRIMARY_500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
      ),
    );

    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: hasIconButton
          ? IconButton(
              onPressed: onPressed,
              style: buttonStyle,
              icon: Icon(
                iconButton,
                color: textColor ?? AppColor.LM_BACKGROUND_BASIC,
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: buttonStyle,
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
    );
  }
}
