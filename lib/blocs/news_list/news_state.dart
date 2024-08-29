part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.error({
    required String errorMessage,
  }) = _Error;
  const factory NewsState.loading() = _Loading;
  const factory NewsState.news({
    required List<NewsModel> newsList,
  }) = _News;
}
