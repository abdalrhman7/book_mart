import 'package:bloc/bloc.dart';
import 'package:book_mart/core/netwoking/api_error_model.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:book_mart/features/product_details_screen/data/repo/product_details_repo.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.productDetailsRepo) : super(ProductDetailsInitial());
  final ProductDetailsRepo productDetailsRepo;

  Future<void> getProductDetails(int productId) async {
    emit(ProductDetailsLoadingState());
    final result = await productDetailsRepo.getProductById(productId);
    result.when(success: (bookModel) {
      emit(ProductDetailsLoadedState(bookModel: bookModel));
    }, failure: (error) {
      emit(ProductDetailsErrorState(apiErrorModel: error));
    });
  }
}
