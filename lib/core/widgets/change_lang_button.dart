import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/material.dart';
import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';


class ChangeLangButton extends StatelessWidget {
  const ChangeLangButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.locale == const Locale('en')
            ? context.setLocale(const Locale('ar'))
            : context.setLocale(const Locale('en'));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: ColorsManager.mainBinkColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(context.tr(LocaleKeys.language),
            style: TextStyles.font16DarkBlackSemeBold
                .copyWith(color: Colors.white)),
      ),
    );
  }
}
