import 'package:book_storage/features/library/widgets/book_created_widget.dart';
import 'package:flutter/material.dart';
import '../configuration/navigation/book_route_base.dart';
import '../features/library/book_manager.dart';
import 'home_page.dart';
import '../domain/models/book_info.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({
    super.key,
    required String title,
  });

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  late final BookCreationCubit bookCreationCubit;

  // void initState() {
  //   bookCreationCubit = BookCreationCubit(context.
  // }

  static const mainPaths = [
    routeBase.addBook,
    routeBase.library,
    routeBase.people,
  ];
  int currentPageIndex = 1;

  // (BuildContext context) {
  //   final path = GoRouterState.of(context).uri.toString();
  //
  //   return mainPaths.indexWhere((element) => path.startsWith(element.path));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Мои прочитанные книги'),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return BookShortInfoWidget(
              bookInfo: BookInfo(
                title: 'Творцы совпадений',
                author: 'Йоав Блум',
                year: 2018,
                publisher: 'АСТ',
                pageCount: 480,
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createBook,
          tooltip: 'Increment',
          child: const Icon(Icons.add_chart_outlined),
        ),
    );
  }

  Future<void> createBook() async {
    final book = await showDialog<BookInfo?>(
      context: context,
      builder: (context) => BookCreatedWidget(
        navigator: Navigator.of(context),
      ),
    );
    if (book != null) {}
  }
}
