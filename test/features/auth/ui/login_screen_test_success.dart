import 'package:book_mart/core/netwoking/api_result.dart';
import 'package:book_mart/features/auth/data/models/login_model/user_data_response.dart';
import 'package:book_mart/features/auth/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../helper/test_widget_helper.dart';
import '../data/auth_mocks.mocks.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockAuthRepo mockRepo;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    mockRepo = MockAuthRepo();
  });

  testWidgets('Login succeeds and navigates away', (tester) async {
    when(mockRepo.login(any)).thenAnswer((_) async {
      return ApiResult.success(
        UserDataResponse(
          data: Data(token: 'token123', user: User(id: 1, name: 'Test')),
        ),
      );
    });

    await tester.pumpWidget(makeTestableWidget(
      child: const LoginScreen(),
      mockRepo: mockRepo,
    ));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('email_field')), 'a@b.com');
    await tester.enterText(find.byKey(const Key('password_field')), 'pass123');
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('login_button')), findsNothing);
    expect(find.text('Mock BottomNavBar'), findsOneWidget);
  });
}
