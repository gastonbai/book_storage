// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookModelImpl _$$BookModelImplFromJson(Map<String, dynamic> json) =>
    _$BookModelImpl(
      id: json['id'] as int?,
      title: json['title'] as String? ?? '',
      publisher: json['publisher'] as String? ?? '',
      author: json['author'] as String? ?? '',
      year: json['year'] as String? ?? '',
      pageCount: json['pageCount'] as String? ?? '',
    );

Map<String, dynamic> _$$BookModelImplToJson(_$BookModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'publisher': instance.publisher,
      'author': instance.author,
      'year': instance.year,
      'pageCount': instance.pageCount,
    };
