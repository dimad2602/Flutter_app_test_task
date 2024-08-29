import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/authentication/authentication_bloc.dart';
import 'package:test_task/pages/news_page/news_page.dart';
import 'package:test_task/pages/news_page/sign_in_page/sign_in_page.dart';

final Map<String, Widget Function(BuildContext context)> routes = {
  '/': (BuildContext context) =>
      BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return state.when(unauthenticated: () {
            return const SignInPage();
          }, authenticated: (user) {
            return const NewsPage();
          });
        },
      ),
};
