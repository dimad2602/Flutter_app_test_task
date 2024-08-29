import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/authentication/authentication_bloc.dart';
import 'package:test_task/pages/news_page/news_page.dart';
import 'package:test_task/pages/profile_page/profile_page.dart';
import 'package:test_task/pages/sign_in_page/sign_in_page.dart';
import 'package:test_task/utils/loading_overlay/loading_overlay.dart';

final Map<String, Widget Function(BuildContext context)> routes = {
  '/': (BuildContext context) =>
      BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return state.when(unauthenticated: () {
            return const LoadingOverlay(child: SignInPage());
          }, authenticated: (user) {
            return const LoadingOverlay(child: NewsPage());
          });
        },
      ),
  '/SignInPage': (BuildContext context) => const SignInPage(),
  '/ProfilePage': (BuildContext context) => const ProfilePage(),
  '/NewsPage': (BuildContext context) => const NewsPage(),
};
