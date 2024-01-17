import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/book_info.dart';
import '../books_storage_hash_keys.dart';

part 'book_model.freezed.dart';

part 'book_model.g.dart';

//модель БД
//каркас для хранения информации, откуда берется информация для виджета
@freezed
abstract class BookModel with _$BookModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BookModel({
    @JsonKey(name: columnId) int? id,
    @Default('') @JsonKey(name: columnTitle) String title,
    @Default('') @JsonKey(name: columnPublisher) String publisher,
    @Default('') @JsonKey(name: columnAuthor) String author,
    @Default('') @JsonKey(name: columnYear) String year,
    @Default('') @JsonKey(name: columnPageCount) String pageCount,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}

//удобное создение модели
extension BookEntity on BookModel {
  static BookModel fromEntity(BookInfo model) {
    return BookModel(
      id: model.id,
      title: model.title,
      publisher: model.publisher,
      author: model.author,
      year: model.year,
      pageCount: model.pageCount,
    );
  }

  BookInfo toEntity() {
    return BookInfo(
      id: id,
      title: title,
      publisher: publisher,
      author: author,
      year: year,
      pageCount: pageCount,
    );
  }
}
