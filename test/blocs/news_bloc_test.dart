import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_task/blocs/news_list/news_bloc.dart';
import 'package:test_task/data/repositories/news_repo/I_news_repo.dart';
import 'package:test_task/models/news_model/news_model.dart';

class MockNewsRepository extends Mock implements INewsRepository {}

void main() {
  late MockNewsRepository _repository;
  late NewsBloc _bloc;

  setUp(() {
    _repository = MockNewsRepository();
    _bloc = NewsBloc(_repository as INewsRepository);
  });
  group("ListSearchState bloc", () {
    blocTest("should emit news state with newsList",
        //arrange
        build: () {
          when(
            () => _repository.fetchNews(),
          ).thenAnswer((_) async => [
                const NewsModel(
                    id: '1', name: 'news name 1', date: "22.03.2024"),
                const NewsModel(
                    id: '2', name: 'news name 2', date: "23.03.2024"),
              ]);
          return _bloc;
        },
        seed: () => const NewsState.initial(),
        //act
        act: (_) => _bloc.add(const NewsEvent.started()),
        //asset
        expect: () => [
              const NewsState.loading(),
              const NewsState.news(newsList: [
                NewsModel(id: '1', name: 'news name 1', date: "22.03.2024"),
                NewsModel(id: '2', name: 'news name 2', date: "23.03.2024"),
              ]),
            ],
        verify: (_) {
          verify(() => _repository.fetchNews());
        });
    blocTest("should emit failure state with fetchNews",
        //arrange
        build: () {
          when(
            () => _repository.fetchNews(),
          ).thenThrow(Exception());
          return _bloc;
        },
        seed: () => const NewsState.news(newsList: []),
        //act
        act: (_) => _bloc.add(const NewsEvent.started()),
        //asset
        expect: () => [
              const NewsState.loading(),
              const NewsState.error(errorMessage: "Fail to fetch news"),
            ],
        verify: (_) {
          verify(() => _repository.fetchNews());
        });
  });
}
