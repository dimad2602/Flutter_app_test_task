import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/data/repositories/sign_in_repo/i_sign_in_repo.dart';
import 'package:test_task/models/user_model/user_model.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final ISignInRepository _repository;
  SignInBloc(this._repository) : super(const SignInState.initial()) {
    on<SignInEvent>((event, emit) async {
      await event.map(
        started: (_) => _started(emit),
        signInWithTelephone: (value) => _signInWithTelephone(value, emit),
      );
    });
  }

  FutureOr<void> _started(Emitter<SignInState> emit) {
    emit(const SignInState.initial());
  }

  FutureOr<void> _signInWithTelephone(
      _SignInWithTelephone value, Emitter<SignInState> emit) async {
    try {
      emit(const SignInState.loading());
      final result =
          await _repository.signInWithTelephone(telephone: value.telephone);
      if (result != null) {
        emit(SignInState.success(user: result));
      } else {
        emit(const SignInState.failure(errorMessage: 'Некорректный ввод'));
      }
    } catch (e) {
      emit(SignInState.failure(errorMessage: '$e'));
    }
  }
}
