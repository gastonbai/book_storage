import 'dart:math';

import 'package:book_storage/core/extensions/widget_padding_extension.dart';
import 'package:flutter/material.dart';
import '../../domain/models/book_info.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>{
  void onTapActiveFilledButton() {}

  ///Создание тела надписей
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('widget.title')
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index,) {
          return BookShortInfoWidget(
            bookInfo: BookInfo(
              title: 'Творцы совпадений',
              author: 'Йоав Блум',
              year: 2018,
              publisher: 'ACT',
              pageCount: 480,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BookShortInfoWidget extends StatelessWidget {
  final BookInfo bookInfo;

  const BookShortInfoWidget({
    super.key,
    required this.bookInfo
  });

  ///Создание закругленного квадратного виджета
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: const ColoredBox(
            color: Colors.blueGrey,
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          ),
        ),
        Column(
          ///Создание жироного шрифта
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              bookInfo.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (bookInfo.author.isEmpty)
              Text(bookInfo.author).paddingOnly(top: 4),

            ///Создание основных надписей
            Row(
              children: [
                Text('Год: '),
                Text(bookInfo.year.toString()),
              ],
            ).paddingOnly(top: 4),
            Row(
              children: [
                Text('Издательство: '),
                Text(bookInfo.publisher),
              ],
            ).paddingOnly(top: 4),
            Text('${bookInfo.pageCount} стр.').paddingOnly(top: 4),
          ],
        ).paddingOnly(left: 10),
      ],
    ).paddingSymmetric(vertical: 8, horisontal: 16);
  }
}