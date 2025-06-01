import 'package:book_mart/core/netwoking/api_result.dart';
import 'package:book_mart/features/auth/data/models/login_model/login_request_body.dart';
import 'package:book_mart/features/auth/data/models/login_model/user_data_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:book_mart/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import '../data/auth_mocks.mocks.dart';


void main() {
  late MockAuthApiService mockApiService;
  late AuthRepo repo;

  setUp(() {
    mockApiService = MockAuthApiService();
    repo = AuthRepo(mockApiService);
  });

  final request = LoginRequestBody(email: 'test@test.com', password: '123456');
  final response = UserDataResponse(
    data: Data(token: 'token123', user: User(id: 1, name: 'Test')),
  );

  test('returns success when login succeeds', () async {
    when(mockApiService.login(request)).thenAnswer((_) async {
      return response;
    });

    final result = await repo.login(request);

    expect(result, isA<Success<UserDataResponse>>());
    result.when(
      success: (data) => expect(data, response),
      failure: (_) => fail('Expected success'),
    );
  });

  test('returns failure when login fails', () async {
    when(mockApiService.login(request)).thenThrow(Exception('error'));

    final result = await repo.login(request);

    expect(result, isA<Failure<UserDataResponse>>());
  });
}

