import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import 'app_divider.dart';
import 'app_dropdown_button.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  bool showActions;
  bool showBackButton;

  MyAppBar(
      {super.key,
      required this.title,
      this.showActions = false,
      this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: AppColor.LM_BACKGROUND_BASIC,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColor.PRIMARY_500,
            ),
      ),
      actions: showActions
          ? <Widget>[
              AppDropDownButton(
                onChanged: (val) {
                  context.setLocale(Locale(val.toString()));
                },
              ),
              const SizedBox(width: 12),
            ]
          : null,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(2),
        child: AppDivider(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
