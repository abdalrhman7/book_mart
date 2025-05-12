part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class SendOtpLoading extends ForgetPasswordState {}

final class SendOtpSuccess extends ForgetPasswordState {}

final class SendOtpFailure extends ForgetPasswordState {
  final ApiErrorModel apiErrorModel ;
  SendOtpFailure(this.apiErrorModel);
}

final class CheckOtpLoading extends ForgetPasswordState {}

final class CheckOtpSuccess extends ForgetPasswordState {}

final class CheckOtpFailure extends ForgetPasswordState {
  final ApiErrorModel apiErrorModel ;
  CheckOtpFailure(this.apiErrorModel);
}


final class ResetPasswordLoading extends ForgetPasswordState {}

final class ResetPasswordSuccess extends ForgetPasswordState {}

final class ResetPasswordFailure extends ForgetPasswordState {
  final ApiErrorModel apiErrorModel ;
  ResetPasswordFailure(this.apiErrorModel);
}