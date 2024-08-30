import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_task/data/dtos/news_dto/news_dto.dart';
import 'package:test_task/data/repositories/news_repo/news_repo.dart';
import 'package:test_task/data/response_models/news_response.dart';
import 'package:test_task/data/services/news_rest_client/news_rest_client.dart';
import 'package:test_task/models/news_model/news_model.dart';

import 'news_repo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NewsRestClient>()])
void main() {
  late MockNewsRestClient newsRestClient;
  late NewsRepo repository;

  setUp(() {
    newsRestClient = MockNewsRestClient();
    repository = NewsRepo(newsRestClient);
  });
  group("Posts repository", () {
    test("should return List<PostDto>", () async {
      // arrange
      when(newsRestClient.fetchNews()).thenAnswer(
        (_) async => NewsResponse(news: [
          NewsDto(
              id: "1",
              name: "name 1",
              date: "22.03.2024",
              image: null,
              description: null),
          NewsDto(
              id: "2",
              name: "name 2",
              date: "23.03.2024",
              image: null,
              description: null),
        ]),
      );
      // act
      final result = await repository.fetchNews();
      // assert
      expect(result, [
        const NewsModel(
            id: "1",
            name: "name 1",
            date: "22.03.2024",
            image: null,
            description: null),
        const NewsModel(
            id: "2",
            name: "name 2",
            date: "23.03.2024",
            image: null,
            description: null),
      ]);
      verify(newsRestClient.fetchNews());
    });
  });
}
