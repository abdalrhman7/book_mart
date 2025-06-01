import 'package:book_mart/core/netwoking/api_result.dart';
import 'package:book_mart/features/auth/data/models/login_model/login_request_body.dart';
import 'package:book_mart/features/auth/data/models/login_model/user_data_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:book_mart/features/auth/data/repo/auth_repo.dart';
import 'package:book_mart/features/auth/data/networking/auth_api_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'auth_mocks.mocks.dart';

@GenerateMocks([AuthApiService, AuthRepo])
void main() {}
