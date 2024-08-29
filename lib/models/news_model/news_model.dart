import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    required String id,
    required String name,
    required String image,
    required String date,
    String? description,
  }) = _NewsModel;
}
