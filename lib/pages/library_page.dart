import 'package:book_storage/features/library/widgets/book_created_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../configuration/navigation/book_route_base.dart';
import 'home_page.dart';
import '../domain/models/book_info.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key, required String title});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  get ter => null;

  void onTapActiveFilledButton() {}

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
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {});
            },
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.insert_chart_outlined_outlined),
                label: 'Library',
              ),
              NavigationDestination(
                icon: Icon(Icons.co_present),
                label: 'People',
              ),
              NavigationDestination(
                icon: Icon(Icons.imagesearch_roller_sharp),
                label: 'Add book',
              ),
            ]));
  }

  Future<void> createBook() async {
    final book = await showDialog<BookInfo?>(
      context: context,
      builder: (context) => BookCreatedWidget(),
    );
  }
}
