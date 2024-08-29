import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/data/dtos/news_dto/news_dto.dart';

part 'news_response.g.dart';
part 'news_response.freezed.dart';

@freezed
class NewsResponse with _$NewsResponse {
  const NewsResponse._();
  const factory NewsResponse({
    required List<NewsDto> news,
  }) = _NewsResponse;

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}