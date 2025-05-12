import 'package:book_mart/core/netwoking/api_error_handler.dart';
import 'package:book_mart/core/netwoking/api_result.dart';
import 'package:book_mart/features/Books_screen/data/networking/filtered_books_api_service.dart';
import 'package:book_mart/features/books_screen/data/model/book_filter.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';

class FilteredBooksRepo {
  final FilteredBooksApiService filteredProductsApiService;

  FilteredBooksRepo(this.filteredProductsApiService);

  Future<ApiResult<ProductData>> filterProducts({
    int? page,
    int? limit,
    BookFilter? filter,
  }) async {
    try {
      final queryParams = {
        if (page != null) 'page': page,
        if (limit != null) 'limit': limit,
        ...?filter?.toQueryParams(),
      };

      final result = await filteredProductsApiService.filterProducts(queryParams);

      return ApiResult.success(result.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }


}
