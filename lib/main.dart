import 'package:flutter/material.dart';
import 'package:test_task/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc()..add(const AuthenticationEvent.checkPreviousLoginIn()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        routes: routes,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
      ),
    );
  }
}