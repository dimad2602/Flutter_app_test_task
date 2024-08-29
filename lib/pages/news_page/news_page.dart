import 'package:flutter/material.dart';
import 'package:test_task/utils/app_colors.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        title: const Text('Новости'),
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.of(context).pushNamed('/ProfilePage');
          },
        ),
      ),
      body: const Text("News page"),
    );
  }
}
