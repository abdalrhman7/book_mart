import 'package:book_mart/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'categories_list_widget.dart';
import 'categories_shimmer_widget.dart';


class BookCategoriesSection extends StatelessWidget {
  const BookCategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h, start: 4.w),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(12),
              bottomStart: Radius.circular(12),
            )
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) => current is GetCategoriesLoading || current is GetCategoriesSuccess || current is GetCategoriesFailure,
            builder: (context, state) {
              if (state is GetCategoriesLoading) {
                return const ShimmerBookCategories();
              } else if (state is GetCategoriesSuccess) {
                return  CategoriesListWidget(categoriesData:  state.categoriesData);
              }else if (state is GetCategoriesFailure) {
                return  Text(state.apiErrorModel.getAllErrorsMessages());
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}




