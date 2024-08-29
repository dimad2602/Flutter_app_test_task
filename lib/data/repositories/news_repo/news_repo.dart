import 'package:dio/dio.dart';
import 'package:test_task/data/repositories/news_repo/I_news_repo.dart';
import 'package:test_task/data/services/news_rest_client/news_rest_client.dart';
import 'package:test_task/models/news_model/news_model.dart';

class NewsRepo implements INewsRepository {
  List<NewsModel> newsList = [];
  @override
  Future<List<NewsModel>> fetchNews() async {
    final dio = Dio();
    try {
      final newsResponse = await NewsRestClient(dio).fetchPosts();

      final List<NewsModel> news =
          newsResponse.news.map((newsDto) => newsDto.toDomain()).toList();

      newsList.addAll(news);

      return newsList;
    } catch (e) {
      rethrow;
    }
  }
}
