// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsDtoImpl _$$NewsDtoImplFromJson(Map<String, dynamic> json) =>
    _$NewsDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      date: json['date'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$NewsDtoImplToJson(_$NewsDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'date': instance.date,
      'description': instance.description,
    };
