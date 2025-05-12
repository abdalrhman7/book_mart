import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/shimmer/shimmer_effect.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BookItemCard extends StatelessWidget {
  const BookItemCard({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.productDetailsScreen , arguments: book.id);
      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsetsDirectional.only(end: 12.w),
        elevation: .6,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          width: 170.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  height: 170.h,
                  width: 170.w,
                  imageUrl:
                  book.image,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      ShimmerEffect(
                        width: 170,
                        height: 170,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
              ),
              verticalSpace(8),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.name,
                      style: TextStyles.font14BlackMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(4),
                    Text(
                      book.category,
                      style: TextStyles.font12DarkBlackMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(4),
                    Text(book.priceAfterDiscount.toString(),
                        style: TextStyles.font12DarkBlackMedium),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: book.price,
                            style: TextStyles.font12DarkBlackMedium
                                .copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const WidgetSpan(
                            child: SizedBox(width: 4),
                          ),
                          TextSpan(
                            text: '${book.discount}%',
                            style: TextStyles.font12DarkBlackMedium
                                .copyWith(
                                color: ColorsManager.mainBinkColor),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(4),
                    Row(children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      horizontalSpace(4),
                      Text(
                        '4.5',
                        style: TextStyles.font12DarkBlackMedium,
                      ),
                      horizontalSpace(8),
                      Text(
                        '14523',
                        style: TextStyles.font12DarkBlackGray,
                      ),
                    ]),
                    verticalSpace(4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
