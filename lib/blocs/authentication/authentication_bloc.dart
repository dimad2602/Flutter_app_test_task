import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/models/user_model/user_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState.unauthenticated()) {
    on<AuthenticationEvent>((event, emit) async {
      await event.map(
        userLoggedIn: (value) => _userLoggedIn(value, emit),
        userLoggedOut: (value) => _userLoggedOut(value, emit),
        checkPreviousLoginIn: (value) => _checkPreviousLoginIn(value, emit),
      );
    });
  }

  FutureOr<void> _userLoggedIn(
      _UserLoggedIn value, Emitter<AuthenticationState> emit) {}

  FutureOr<void> _userLoggedOut(
      _UserLoggedOut value, Emitter<AuthenticationState> emit) {}

  FutureOr<void> _checkPreviousLoginIn(
      _CheckPreviousLoginIn value, Emitter<AuthenticationState> emit) {}
}
