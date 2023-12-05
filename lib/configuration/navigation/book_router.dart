import 'package:book_storage/configuration/navigation/Book_Route_Base.dart';
import 'package:book_storage/pages/library_page.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/book_info.dart';

class bookRouter {
  static GoRouter create(BookInfo bookInfo) {
    return GoRouter(routes: [
      ShellRoute(routes: [
        GoRoute(
          path: routeBase.library.path,
          name: routeBase.library.name,
          builder: (context, state) => const LibraryPage(title: 'Home' )
        ),
        GoRoute(
          path: routeBase.people.path,
          name: routeBase.people.name,
          builder: (context, state) => const LibraryPage(title: 'people'),
        ),
        GoRoute(
          path: routeBase.addBook.path,
          name: routeBase.addBook.name,
          builder: (context, state) => const LibraryPage(title: 'addBook'),
        ),
      ])
    ]);
  }
}

