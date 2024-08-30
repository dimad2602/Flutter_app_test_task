import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_task/data/response_models/news_response.dart';

part 'news_rest_client.g.dart';

@RestApi(baseUrl: 'https://webstripe.ru')
abstract class NewsRestClient {
  factory NewsRestClient(Dio dio, {String baseUrl}) = _NewsRestClient;

  @GET('/list.json')
  Future<NewsResponse> fetchNews();
}
