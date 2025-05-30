import 'package:book_mart/core/di/dependency_injection.dart';
import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/features/product_details_screen/data/repo/product_details_repo.dart';
import 'package:book_mart/features/product_details_screen/logic/product_details_cubit.dart';
import 'package:book_mart/features/product_details_screen/ui/widgets/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, this.bookId});

  final int? bookId;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final canPop = Navigator.of(context).canPop();
        if (!canPop) {
          context.pushReplacementNamed(Routes.bottomNavBar);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
        ),
        body: BlocProvider(
          create: (context) => ProductDetailsCubit(getIt<ProductDetailsRepo>())..getProductDetails(bookId!),
          child: const ProductDetailsBody(),
        ),
      ),
    );
  }
}

