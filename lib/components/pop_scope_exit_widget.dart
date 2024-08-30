import 'dart:io';

import 'package:flutter/material.dart';

class PopScopeExitWidget extends StatelessWidget {
  final Widget child;
  const PopScopeExitWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Вы уверены?'),
                content: const Text('Вы хотите закрыть приложение'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Нет'),
                  ),
                  TextButton(
                    onPressed: () => exit(0),
                    child: const Text('Да'),
                  ),
                ],
              ),
            ) ??
            false;
      },
      child: child,
    );
  }
}
