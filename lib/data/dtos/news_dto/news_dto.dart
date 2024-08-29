import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/models/news_model/news_model.dart';

part 'news_dto.g.dart';
part 'news_dto.freezed.dart';

@freezed
class NewsDto with _$NewsDto {
  const NewsDto._();
  factory NewsDto({
    required String id,
    required String name,
    required String image,
    required String date,
    String? description,
  }) = _NewsDto;

  NewsModel toDomain() => NewsModel(
      id: id, name: name, image: image, date: date, description: description);

  factory NewsDto.fromJson(Map<String, dynamic> json) =>
      _$NewsDtoFromJson(json);
}
