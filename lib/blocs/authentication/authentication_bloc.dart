import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/data/storage/user_storage.dart';
import 'package:test_task/models/user_model/user_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SecureStorage storage = SecureStorage();

  AuthenticationBloc() : super(const AuthenticationState.unauthenticated()) {
    on<AuthenticationEvent>((event, emit) async {
      await event.map(
        userLoggedIn: (value) => _userLoggedIn(value, emit),
        userLoggedOut: (_) => _userLoggedOut(_, emit),
        checkPreviousLoginIn: (_) => _checkPreviousLoginIn(_, emit),
      );
    });
  }

  FutureOr<void> _userLoggedIn(
      _UserLoggedIn value, Emitter<AuthenticationState> emit) {
    emit(AuthenticationState.authenticated(value.user));
  }

  FutureOr<void> _userLoggedOut(
      _UserLoggedOut _, Emitter<AuthenticationState> emit) {
    emit(const AuthenticationState.unauthenticated());
  }

  FutureOr<void> _checkPreviousLoginIn(
      _CheckPreviousLoginIn value, Emitter<AuthenticationState> emit) async {
    final userTel = await storage.getUserTel();
    if (userTel != null) {
      emit(AuthenticationState.authenticated(User(telephone: userTel)));
    } else {
      emit(const AuthenticationState.unauthenticated());
    }
  }
}
