part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class LogoutSuccess extends ProfileState {}

final class LogoutLoading extends ProfileState {}

final class LogoutFailure extends ProfileState {
  final ApiErrorModel apiErrorModel;

  LogoutFailure(this.apiErrorModel);
}

final class GetUserDataLoading extends ProfileState {}

final class GetUserDataSuccess extends ProfileState {
  final User user;

  GetUserDataSuccess(this.user);
}
