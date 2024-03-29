
//база данных
import 'dart:async';
import 'package:book_storage/domain/models/book_create.dart';
import 'package:book_storage/domain/models/book_info.dart';
import 'package:sqflite/sqflite.dart';
import 'books_storage_hash_keys.dart';
import 'models/book_model.dart';

class BooksDataSource {
  late Database database;
  bool isInit = false;


  //инициализировать БД
  Future<void> init() async {
    if (isInit) {
      return;
    }

    var databasesPath = await getDatabasesPath();
    String path = '$databasesPath/user_books.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: createDatabase,
    );
  }

  //удалить БД
  Future<void> dispose() async {
    await database.close().then((_) => isInit = false);
  }

  //создать БД
  Future<BookInfo> create(BookInfo book) async {
    final bookId = await database.insert(
      tableUserBooks,
      BookEntity.fromEntity(book).toJson(),
    );

    return book.copyWith(id: bookId);
  }

  //вывести все из БД
  Future<List<BookInfo>> getAll() async {
    final records = await database.query(tableUserBooks);

    return records.map((e) => BookModel.fromJson(e).toEntity()).toList();
  }

  //обновить БД
  Future<int> remove(int id) async {
    return database.delete(
      tableUserBooks,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  //создание таблицы БД
  FutureOr<void> createDatabase(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $tableUserBooks ('
      '$columnId INTEGER PRIMARY KEY, '
      '$columnTitle TEXT, '
      '$columnPublisher TEXT, '
      '$columnAuthor TEXT, '
      '$columnYear INTEGER, '
      '$columnPageCount INTEGER'
      ')',
    );
  }
}
