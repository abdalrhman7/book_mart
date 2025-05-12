import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/features/books_screen/logic/books_cubit.dart';
import 'package:book_mart/features/home/ui/widgets/sort_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_bottom_sheet.dart';

class SortAndFilterBar extends StatelessWidget {
  const SortAndFilterBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              context.tr(LocaleKeys.popularBooks),
            style: TextStyles.font18BlackSemiBold,
          ),
          FilterButton(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext ctx) {
                  return BlocProvider.value(
                    value: BlocProvider.of<BooksCubit>(context),
                    child: const CustomBottomSheet(),
                  );
                },
              );
            },
            label: context.tr(LocaleKeys.filter),
            icon: const Icon(
              Icons.filter_alt_outlined,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}


