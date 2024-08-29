import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/data/repositories/sign_in_repo/I_sign_in_repo.dart';
import 'package:test_task/models/user_model/user_model.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final ISignInRepository _repository;
  SignInBloc(this._repository) : super(const SignInState.initial()) {
    on<SignInEvent>((event, emit) async{
      await event.map(started: (_) => _started(emit), signInWithTelephone: (value) => _signInWithTelephone(value, emit),);
    });
  }
  
  FutureOr<void> _started(Emitter<SignInState> emit) {}
  
  FutureOr<void> _signInWithTelephone(_SignInWithTelephone value, Emitter<SignInState> emit) {}
}
