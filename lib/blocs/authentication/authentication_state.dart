part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();

  const factory AuthenticationState.unauthenticated() = _Unauthenticated;
  const factory AuthenticationState.authenticated(User user) = _Authenticated;

  User? get user {
    return mapOrNull(
      authenticated: (value) => value.user,
    );
  }
}
