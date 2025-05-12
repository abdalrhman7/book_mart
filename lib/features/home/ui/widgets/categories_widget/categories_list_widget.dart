import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/features/home/data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({
    super.key, required this.categoriesData,
  });
  final CategoriesData categoriesData ;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.w,
      children: List.generate(categoriesData.categories.length, (index) =>
          Column(
            children: [
              CircleAvatar(
                radius: 35,
                child: Image.network(
                  'https://www.worldbookday.com/wp-content/uploads/2023/11/BookStacks_large_1-1-e1700482243590.png',
                ),
              ),
              verticalSpace(4),
              SizedBox(
                width: 80.w,
                child: Text(
                  categoriesData.categories[index].name,
                  textAlign: TextAlign.center,
                  style: TextStyles.font12BlackMedium,
                  softWrap: true,
                ),
              ),
            ],
          ),
      ),
    );

  }
}