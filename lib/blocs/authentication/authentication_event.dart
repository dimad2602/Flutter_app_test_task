part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.userLoggedIn(User user) = _UserLoggedIn;
  const factory AuthenticationEvent.userLoggedOut() = _UserLoggedOut;
  const factory AuthenticationEvent.checkPreviousLoginIn() = _CheckPreviousLoginIn;
}