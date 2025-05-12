import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/app_text_form_faild.dart';
import 'package:book_mart/core/widgets/section_header.dart';
import 'package:book_mart/features/home/ui/widgets/books_search_bar.dart';
import 'package:book_mart/features/home/ui/widgets/search_widget.dart';
import 'package:book_mart/features/home/ui/widgets/slider_section.dart';
import 'package:book_mart/features/books_screen/ui/widgets/sort_and_filter_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'best_seller_section.dart';
import 'categories_widget/book_categories_section.dart';
import 'new_arrival_bloc_builder.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomScrollView(
        slivers: [
          const BooksSearchBar(),
          sliverVerticalSpace(8),
          const BookCategoriesSection(),
          sliverVerticalSpace(4),
          const ImageSliderBlocBuilder(),
          sliverVerticalSpace(8),
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/deal2.png',
              fit: BoxFit.fill,
            ),
          ),
          sliverVerticalSpace(8),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SectionHeader(title: context.tr(LocaleKeys.bestSeller)),
                verticalSpace(4),
                const BestSellerSectionBlocBuilder(),
              ],
            ),
          ),
          sliverVerticalSpace(8),
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/special_offer.png',
              fit: BoxFit.fill,
            ),
          ),
          sliverVerticalSpace(8),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SectionHeader(title: context.tr(LocaleKeys.newArrival)),
                verticalSpace(4),
                const NewArrivalBlocBuilder(),
              ],
            ),
          ),
          sliverVerticalSpace(8),
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/trending_product.png',
              fit: BoxFit.fill,
            ),
          ),
          sliverVerticalSpace(8),
        ],
      ),
    );
  }
}


