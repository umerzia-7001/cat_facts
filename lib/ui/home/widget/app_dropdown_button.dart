import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';

class AppDropDownButton extends StatelessWidget {
  final void Function(Locale?) onChanged;

  const AppDropDownButton({Key? key, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const Icon(
        Icons.language,
        size: 16,
        color: AppColor.PRIMARY_500,
      ),
      items: supportedLocales.map((locale) {
        return DropdownMenuItem(
          value: locale,
          child: Text(
            easy.tr(locale.languageCode),
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColor.PRIMARY_500),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      value: context.locale,
    );
  }
}
