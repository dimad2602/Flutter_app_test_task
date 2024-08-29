import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/news_list/news_bloc.dart';
import 'package:test_task/data/repositories/news_repo/news_repo.dart';
import 'package:test_task/utils/app_colors.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(NewsRepo())..add(const NewsEvent.started()),
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          title: const Text('Новости'),
          backgroundColor: AppColors.appBarColor,
          leading: IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).pushNamed('/ProfilePage');
            },
          ),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return state.map(
                initial: (_) {
                  return Text("initial");
                },
                error:  (errorMessage) {
                  return Text("${errorMessage}");
                },
                loading:  (_) {
                  return Text("loading");
                },
                news:  (newsList) {
                  return Text("${newsList}");
                });
          },
        ),
      ),
    );
  }
}
