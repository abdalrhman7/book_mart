import 'package:book_mart/core/netwoking/api_error_model.dart';
import 'package:book_mart/core/netwoking/api_result.dart';
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

  testWidgets('Login fails and shows error dialog', (tester) async {
    final errorModel = ApiErrorModel(message: 'Wrong credentials', code: 401);
    when(mockRepo.login(any)).thenAnswer((_) async {
      return ApiResult.failure(errorModel);
    });

    await tester.pumpWidget(makeTestableWidget(
      child: const LoginScreen(),
      mockRepo: mockRepo,
    ));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('email_field')), 'wrong@user.com');
    await tester.enterText(find.byKey(const Key('password_field')), 'badpass');
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Wrong credentials'), findsOneWidget);

    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
    expect(find.byKey(const Key('login_button')), findsOneWidget);
  });
}
