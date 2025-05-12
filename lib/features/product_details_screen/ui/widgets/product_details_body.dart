import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/netwoking/api_constants.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/app_text_button.dart';
import 'package:book_mart/core/widgets/show_bar.dart';
import 'package:book_mart/features/bottom_nav_bar/logic/bottom_nav_bar_cubit.dart';
import 'package:book_mart/features/cart/logic/cart_cubit.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:book_mart/features/product_details_screen/logic/product_details_cubit.dart';
import 'package:book_mart/features/product_details_screen/ui/widgets/price_with_discount.dart';
import 'package:book_mart/features/product_details_screen/ui/widgets/product_details_image.dart';
import 'package:book_mart/features/product_details_screen/ui/widgets/product_details_rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:share_plus/share_plus.dart';
import 'add_to_cart_bloc_builder_button.dart';
import 'add_to_cart_bloc_listener.dart';
import 'delivery_in_widget.dart';
import 'expanded_description_text.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if(state is ProductDetailsLoadedState) {
            final book = state.bookModel;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailsImage(
                    imageUrl: book.image,
                  ),
                  verticalSpace(16),
                  Text(
                    book.name,
                    style: TextStyles.font20BlackSemiBold,
                  ),
                  verticalSpace(8),
                  Text(
                    book.category,
                    style: TextStyles.font14BlackMedium,
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      const ProductDetailsRateWidget(),
                      horizontalSpace(12),
                      GestureDetector(
                        onTap: () {
                          SharePlus.instance.share(
                            ShareParams(
                              text: 'Check out this book: ${book
                                  .name}\n${'https://codingarabic.online/product/${book
                                  .id}'}',
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade100,
                            boxShadow: const[
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.share,
                            size: 20,
                            color: Color(0xff0B3689),
                          ),
                        ),
                      )

                    ],
                  ),
                  verticalSpace(8),
                  const PriceWithDiscount(),
                  verticalSpace(8),
                  Text(
                    'Product Details',
                    style: TextStyles.font14BlackSemiBold,
                  ),
                  verticalSpace(4),
                  ExpandedDescriptionText(
                    description: book.description,
                  ),
                  verticalSpace(16),
                  Image.asset(
                    'assets/images/product_details_group.png',
                    width: 0.75.sw,
                  ),
                  verticalSpace(16),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<BottomNavBarCubit>()
                          .bottomNavbarController
                          .jumpToTab(2);
                    },
                    child:
                    Image.asset('assets/images/go_to_cart.png', width: 0.40.sw),
                  ),
                  verticalSpace(16),
                  const DeliveryInWidget(),
                  verticalSpace(16),
                  AddToCartBlocBuilderButton(book: book),
                  const AddToCartBlocListener(),
                  verticalSpace(8),
                ],
              ),
            );
          }else if (state is ProductDetailsErrorState) {
            return Center(child: Text(state.apiErrorModel.getAllErrorsMessages()));
          }else {
            return const Center(child: CircularProgressIndicator());
          }

        },
      ),
    );
  }
}


