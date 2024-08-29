import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/data/repositories/news_repo/I_news_repo.dart';
import 'package:test_task/models/news_model/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final INewsRepository _repository;
  NewsBloc(this._repository) : super(const NewsState.initial()) {
    on<NewsEvent>((event, emit) async {
      await event.map(started: (_) => _started(emit));
    });
  }

  FutureOr<void> _started(Emitter<NewsState> emit) async {
    emit(const NewsState.loading());
    try {
      final news = await _repository.fetchNews();
      emit(NewsState.news(newsList: news));
    } catch (e) {
      emit(const NewsState.error(errorMessage: "Fail to fetch news"));
    }
  }
}
