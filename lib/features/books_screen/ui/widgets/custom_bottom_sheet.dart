import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/app_text_button.dart';
import 'package:book_mart/features/books_screen/logic/books_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BooksCubit>();
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(context.tr(LocaleKeys.filter)),
                  style: TextStyles.font20BlackSemiBold,
                ),
                cubit.isFilterApplied
                    ? GestureDetector(
                        onTap: () {
                          cubit.clearFilter();
                          context.pop();
                        },
                        child: Container(
                            padding: EdgeInsets.all(6.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.blue.shade500,
                            ),
                            child: Text(context.tr(LocaleKeys.clearFilter),
                                style: TextStyles.font14WhiteMedium)),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(LocaleKeys.filterByBestSeller),
                  style: TextStyles.font16BlackSemiBold,
                ),
                Checkbox(
                  value: cubit.isBestSellersChecked,
                  onChanged: (value) {
                    setState(() {
                      cubit.isBestSellersChecked = value!;
                    });
                  },
                )
              ],
            ),
            RangeSlider(
              values: RangeValues(cubit.minPrice, cubit.maxPrice),
              min: 100,
              max: 500,
              labels: RangeLabels(
                cubit.minPrice.toInt().toString(),
                cubit.maxPrice.toInt().toString(),
              ),
              onChanged: (RangeValues values) {
                cubit.isPriceRangeSelected = true;
                setState(() {
                  cubit.minPrice = values.start;
                  cubit.maxPrice = values.end;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${context.tr(LocaleKeys.minPrice)} : ${cubit.minPrice.toInt()}",
                  style: TextStyles.font14BlackMedium,
                ),
                Text(
                  "${context.tr(LocaleKeys.maxPrice)} : ${cubit.maxPrice.toInt()}",
                  style: TextStyles.font14BlackMedium,
                ),
              ],
            ),
            const Spacer(),
            AppTextButton(
              buttonText: context.tr(LocaleKeys.applyFilter),
              onPressed: () {
                cubit.applyFilter();
                context.pop();
              },
            ),
            verticalSpace(8),
          ],
        ),
      ),
    );
  }
}
