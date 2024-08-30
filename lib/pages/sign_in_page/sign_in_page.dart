import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/authentication/authentication_bloc.dart';
import 'package:test_task/blocs/sign_in/sign_in_bloc.dart';
import 'package:test_task/components/pop_scope_exit_widget.dart';
import 'package:test_task/data/repositories/sign_in_repo/sign_in_repo.dart';
import 'package:test_task/pages/sign_in_page/sing_in_complite_ui.dart';
import 'package:test_task/utils/app_colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(SignInRepo()),
      child: PopScopeExitWidget(
        child: Scaffold(
          backgroundColor: AppColors.mainColor,
          body: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              state.maybeWhen(
                  failure: (_) {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Ошибка: ${state.errorMessage}')));
                  },
                  orElse: () {});
            },
            builder: (context, state) {
              return BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  return state.when(initial: () {
                    return signInCompleteUI(context);
                  }, loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }, failure: (error) {
                    return signInCompleteUI(context);
                  }, success: (user) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      context
                          .read<AuthenticationBloc>()
                          .add(AuthenticationEvent.userLoggedIn(user));
                      Navigator.of(context).pushNamed('/NewsPage');
                    });
                    return const SizedBox.shrink();
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
