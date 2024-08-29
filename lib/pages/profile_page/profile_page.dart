import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/authentication/authentication_bloc.dart';
import 'package:test_task/data/storage/user_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SecureStorage storage = SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return state.when(unauthenticated: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context
                      .read<AuthenticationBloc>()
                      .add(const AuthenticationEvent.userLoggedOut());
                  Navigator.of(context).pushNamed('/SignInPage');
                });
                return const SizedBox.shrink();
              }, authenticated: (user) {
                return state.user != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text("Вы вошли в аккаунт ${state.user!.telephone}"),
                            const SizedBox(
                              height: 12,
                            ),
                            FilledButton(
                              onPressed: () async {
                                storage.deleteUserTel();
                                context.read<AuthenticationBloc>().add(
                                    const AuthenticationEvent.userLoggedOut());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff6750a4),
                              ),
                              child: const Text(
                                'Выйти из аккаунта?',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ])
                    : const SizedBox.shrink();
              });
            },
          ),
        ));
  }
}
