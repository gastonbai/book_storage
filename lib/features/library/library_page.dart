import 'package:flutter/material.dart';

import '../../configuration/navigation/home_page.dart';
import '../../domain/models/book_info.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key, required String title});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  void onTapActiveFilledButton() {}

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
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add_chart_outlined),
      ),
    );
  }
}
