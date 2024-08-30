import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/authentication/authentication_bloc.dart';
import 'package:test_task/blocs/sign_in/sign_in_bloc.dart';
import 'package:test_task/components/big_text_widget.dart';
import 'package:test_task/components/medium_text_widget.dart';
import 'package:test_task/components/sign_in_filled_button_widget.dart';
import 'package:test_task/components/sign_in_text_field_widget.dart';
import 'package:test_task/utils/app_colors.dart';

Widget signInCompleteUI(BuildContext context) {
  final TextEditingController telephoneController = TextEditingController();
  return BlocBuilder<AuthenticationBloc, AuthenticationState>(
    builder: (context, state) {
      return state.when(authenticated: (user) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context
              .read<AuthenticationBloc>()
              .add(AuthenticationEvent.userLoggedIn(user));
          Navigator.of(context).pushReplacementNamed('/NewsPage');
        });
        return const SizedBox.shrink();
      }, unauthenticated: () {
        return SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 175.0, left: 18, right: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BigText(text: "Авторизоватся"),
                  const SizedBox(
                    height: 48,
                  ),
                  const MediumText(text: "Номер телефона (обязательно)"),
                  SignInTextFieldWidget(
                    controller: telephoneController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: 150,
                    child: SignInFilledButtonWidget(
                      onPressed: () {
                        context.read<SignInBloc>().add(
                            SignInEvent.signInWithTelephone(
                                telephone: telephoneController.text));
                      },
                      text: const MediumText(
                        text: "Вход",
                      ),
                      color: AppColors.buttonColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    },
  );
}
