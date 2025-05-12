import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.searchScreen);
        },
        child: Card(
          elevation: 0.5,
          child: Container(
              height: 46.h,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search_rounded,
                    color: ColorsManager.lightGray,
                  ),
                  horizontalSpace(12),
                  Text(
                    context.tr(LocaleKeys.searchHint),
                    style: TextStyles.font14LightGrayRegular,
                  )
                ],
              )),
        ),
      ),
    );
  }
}