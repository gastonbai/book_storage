import 'package:book_storage/domain/models/book_create.dart';

import '../../features/library/book_manager.dart';

///Создание заголовка, издательства, автора
class BookInfo {
  final String title;
  final String publisher;
  final String author;

  ///Только положительные значения для года и количества страниц
  final int? id;
  final String year;
  final String pageCount;

  ///Содержание в строке
  BookInfo( {
    this.title = '',
    this.publisher = '',
    this.author = '',
    this.year = '',
    this.pageCount = '',
    this.id,
  });
}

extension BookCopy on BookInfo {
  BookInfo copyWith({
    int? id,
    String? title,
    String? publisher,
    String? author,
    String? year,
    String? pageCount,
  }) {
    return BookInfo(
      title: title ?? this.title,
      publisher: publisher ?? this.publisher,
      author: author ?? this.author,
      year: year ?? this.year,
      pageCount: pageCount ?? this.pageCount,
    );
  }
}

