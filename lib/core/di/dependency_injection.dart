import 'package:book_mart/core/netwoking/dio_factory.dart';
import 'package:book_mart/core/netwoking/payment_api_services/paymob_api_services/paymob_api_service.dart';
import 'package:book_mart/core/netwoking/payment_api_services/stripe_api_service/stripe_api_service.dart';
import 'package:book_mart/features/books_screen/data/networking/filtered_books_api_service.dart';
import 'package:book_mart/features/books_screen/data/repo/filtered_books_repo.dart';
import 'package:book_mart/features/auth/data/networking/auth_api_service.dart';
import 'package:book_mart/features/auth/data/repo/auth_repo.dart';
import 'package:book_mart/features/cart/data/networking/cart_api_services.dart';
import 'package:book_mart/features/cart/data/repo/cart_repo.dart';
import 'package:book_mart/features/cart/logic/cart_cubit.dart';
import 'package:book_mart/features/checkout/date/networking/checkout_api_service.dart';
import 'package:book_mart/features/checkout/date/repo/checkout_repo.dart';
import 'package:book_mart/features/checkout/logic/checkout_cubit/checkout_cubit.dart';
import 'package:book_mart/features/home/data/networking/home_api_service.dart';
import 'package:book_mart/features/home/data/repo/home_repo.dart';
import 'package:book_mart/features/manage_profile/data/networking/complete_profile_api_service.dart';
import 'package:book_mart/features/manage_profile/data/repo/complete_profile_repo.dart';
import 'package:book_mart/features/product_details_screen/data/networking/product_details_api_service.dart';
import 'package:book_mart/features/product_details_screen/data/repo/product_details_repo.dart';
import 'package:book_mart/features/profile/data/networking/profile_api_service.dart';
import 'package:book_mart/features/profile/data/repo/profile_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  getIt.registerLazySingleton<Dio>(() => Dio());
  Dio defaultDio = await DioFactory.getDio(DioType.defaultDio);

  //Auth
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(defaultDio));
  getIt
      .registerLazySingleton<AuthRepo>(() => AuthRepo(getIt<AuthApiService>()));

  //complete profile
  getIt.registerLazySingleton<CompleteProfileApiService>(
      () => CompleteProfileApiService(defaultDio));
  getIt.registerLazySingleton<CompleteProfileRepo>(
      () => CompleteProfileRepo(getIt<CompleteProfileApiService>()));

  //profile
  getIt.registerLazySingleton<ProfileApiService>(
      () => ProfileApiService(defaultDio));
  getIt.registerLazySingleton<ProfileRepo>(
      () => ProfileRepo(getIt<ProfileApiService>()));

  //home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(defaultDio));
  getIt
      .registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<HomeApiService>()));

  //search
  getIt.registerLazySingleton<FilteredBooksApiService>(
      () => FilteredBooksApiService(defaultDio));
  getIt.registerLazySingleton<FilteredBooksRepo>(
      () => FilteredBooksRepo(getIt<FilteredBooksApiService>()));

  //cart
  getIt.registerLazySingleton<CartApiServices>(
      () => CartApiServices(defaultDio));
  getIt.registerLazySingleton<CartRepo>(
      () => CartRepo(getIt<CartApiServices>()));
  getIt.registerLazySingleton<CartCubit>(() => CartCubit(getIt<CartRepo>()));

  //product details
  getIt.registerLazySingleton<ProductDetailsApiService>(
      () => ProductDetailsApiService(defaultDio));
  getIt.registerLazySingleton<ProductDetailsRepo>(
      () => ProductDetailsRepo(getIt<ProductDetailsApiService>()));

  //payment
  getIt.registerLazySingletonAsync<PaymobApiService>(() async {
    final dio = await DioFactory.getDio(DioType.paymobDio);
    return PaymobApiService(dio);
  });

  getIt.registerLazySingletonAsync<StripeApiService>(() async {
    return StripeApiService(await DioFactory.getDio(DioType.stripeDio));
  });

  getIt.registerLazySingleton<CheckoutApiService>(
      () => CheckoutApiService(defaultDio));

  getIt.registerLazySingleton<CheckoutRepo>(
      () => CheckoutRepo(getIt<CheckoutApiService>()));

  getIt.registerFactory<CheckoutCubit>(() => CheckoutCubit(getIt<CheckoutRepo>()));

}
