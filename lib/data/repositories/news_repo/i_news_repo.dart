import 'package:test_task/models/news_model/news_model.dart';

abstract class INewsRepository {
  Future<List<NewsModel>> fetchNews();
}
