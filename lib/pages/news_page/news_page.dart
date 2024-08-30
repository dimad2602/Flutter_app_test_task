import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/news_list/news_bloc.dart';
import 'package:test_task/components/medium_text_widget.dart';
import 'package:test_task/components/pop_scope_exit_widget.dart';
import 'package:test_task/data/repositories/news_repo/news_repo.dart';
import 'package:test_task/pages/news_page/news_complite_ui.dart';
import 'package:test_task/utils/app_colors.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(NewsRepo())..add(const NewsEvent.started()),
      child: PopScopeExitWidget(
        child: Scaffold(
          backgroundColor: AppColors.mainColor,
          appBar: AppBar(
            title: const MediumText(
              text: 'Новости',
              appbar: true,
            ),
            backgroundColor: AppColors.appBarColor,
            centerTitle: true,
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
                  initial: (_) => const SizedBox.shrink(),
                  error: (state) {
                    return Center(
                        child: Text(
                      state.errorMessage,
                      style: const TextStyle(fontSize: 18),
                    ));
                  },
                  loading: (_) =>
                      const Center(child: CircularProgressIndicator()),
                  news: (state) {
                    return newsCompliteUI(context, state.newsList);
                  });
            },
          ),
        ),
      ),
    );
  }
}
