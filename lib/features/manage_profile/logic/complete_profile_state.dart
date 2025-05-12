part of 'complete_profile_cubit.dart';

@immutable
sealed class CompleteProfileState {}

final class CompleteProfileInitial extends CompleteProfileState {}

final class ImagePickedSuccess extends CompleteProfileState {}
final class CompleteProfileLoading extends CompleteProfileState {}
final class CompleteProfileSuccess extends CompleteProfileState {}
final class UpdateProfileSuccess extends CompleteProfileState {}
final class CompleteProfileFailure extends CompleteProfileState {
  final ApiErrorModel apiErrorModel ;

  CompleteProfileFailure(this.apiErrorModel);
}
