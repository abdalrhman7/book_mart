import 'package:bloc_test/bloc_test.dart';
import 'package:book_mart/core/netwoking/api_error_model.dart';
import 'package:book_mart/core/netwoking/api_result.dart';
import 'package:book_mart/features/auth/data/models/login_model/user_data_response.dart';
import 'package:book_mart/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../data/auth_mocks.mocks.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockAuthRepo mockRepo;
  late LoginCubit cubit;

  setUp(() {
    mockRepo = MockAuthRepo();
    cubit = LoginCubit(mockRepo);
    cubit.emailController.text = 'a@b.com';
    cubit.passwordController.text = 'pass123';
  });

  final response = UserDataResponse(
    data: Data(token: 'token123', user: User(id: 1, name: 'Test')),
  );

  blocTest<LoginCubit, LoginState>(
    'emits [LoginLoading, LoginSuccess] when login is successful',
    build: () {
      when(mockRepo.login(any)).thenAnswer((_) async => ApiResult.success(response));
      return cubit;
    },
    act: (c) => c.emitLoginStates(),
    expect: () => [isA<LoginLoading>(), isA<LoginSuccess>()],
  );

  blocTest<LoginCubit, LoginState>(
    'emits [LoginLoading, LoginFailure] when login fails',
    build: () {
      final error = ApiErrorModel(
        message: 'Wrong credentials',
        code: 401,
      );

      when(mockRepo.login(any)).thenAnswer((_) async => ApiResult.failure(error));

      return cubit;
    },
    act: (c) => c.emitLoginStates(),
    expect: () => [isA<LoginLoading>(), isA<LoginFailure>()],
  );
}
