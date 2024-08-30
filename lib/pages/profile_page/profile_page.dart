import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/authentication/authentication_bloc.dart';
import 'package:test_task/components/medium_text_widget.dart';
import 'package:test_task/components/sign_in_filled_button_widget.dart';
import 'package:test_task/components/sign_in_text_field_widget.dart';
import 'package:test_task/data/storage/user_storage.dart';
import 'package:test_task/utils/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SecureStorage storage = SecureStorage();
  @override
  Widget build(BuildContext context) {
    final TextEditingController telephoneController = TextEditingController();
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          centerTitle: true,
          title: const MediumText(
            text: "Профиль",
            appbar: true,
          ),
          backgroundColor: AppColors.appBarColor,
        ),
        body: Center(
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return state.when(unauthenticated: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context
                      .read<AuthenticationBloc>()
                      .add(const AuthenticationEvent.userLoggedOut());
                  Navigator.of(context).pushReplacementNamed('/SignInPage');
                });
                return const SizedBox.shrink();
              }, authenticated: (user) {
                String formattedPhone = user.telephone;

                if (formattedPhone.startsWith('8')) {
                  formattedPhone = '+7${formattedPhone.substring(1)}';
                } else if (formattedPhone.startsWith('7')) {
                  formattedPhone = '+7${formattedPhone.substring(1)}';
                } else {
                  formattedPhone = '+$formattedPhone';
                }

                telephoneController.text = formattedPhone;

                return state.user != null
                    ? Padding(
                      padding: const EdgeInsets.only(bottom: 175, left: 18, right: 18),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              const MediumText(
                                  text: "Номер телефона"),
                              SignInTextFieldWidget(
                                controller: telephoneController,
                                keyboardType: TextInputType.number,
                                enable: false,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                width: 150,
                                child: SignInFilledButtonWidget(
                                  onPressed: () async {
                                    storage.deleteUserTel();
                                    context.read<AuthenticationBloc>().add(
                                        const AuthenticationEvent
                                            .userLoggedOut());
                                  },
                                  text: const MediumText(
                                    text: "Выход",
                                  ),
                                  color: AppColors.buttonColor,
                                ),
                              ),
                            ]),
                    )
                    : const SizedBox.shrink();
              });
            },
          ),
        ));
  }
}
