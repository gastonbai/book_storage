///Создание заголовка, издательства, автора
class BookInfo {
  final String title;
  final String publisher;
  final String author;

  ///Только положительные значения для года и количества страниц
  final int? id;
  final int year;
  final int pageCount;

  ///Содержание в строке
  BookInfo( {
    this.title = '',
    this.publisher = '',
    this.author = '',
    this.year = -1,
    this.pageCount = 0,
    this.id = 1,
  });

  BookInfo copyWith({
    int? id,
    String? title,
    String? publisher,
    String? author,
    int? year,
    int? pageCount,
  }) {
    return BookInfo(
      id: id ?? this.id,
      title: title ?? this.title,
      publisher: publisher ?? this.publisher,
      author: author ?? this.author,
      year: year ?? this.year,
      pageCount: pageCount ?? this.pageCount,
    );
  }
}
