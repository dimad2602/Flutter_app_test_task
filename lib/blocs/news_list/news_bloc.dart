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
    on<NewsEvent>((event, emit) async {});
  }
}
