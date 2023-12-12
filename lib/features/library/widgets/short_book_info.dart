import 'package:book_storage/core/extensions/widget_padding_extension.dart';
import 'package:book_storage/domain/models/book_info.dart';
import 'package:flutter/material.dart';

class BookShortInfoWidget extends StatelessWidget {
  final BookInfo bookInfo;

  const BookShortInfoWidget({
    required this.bookInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const ColoredBox(
            color: Colors.deepPurple,
            child: SizedBox(
              width: 120,
              height: 120,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              bookInfo.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            if (bookInfo.author.isEmpty)
              Text(bookInfo.author).paddingOnly(top: 5),
            Row(
              children: [
                Text('Название: '),
                Text(bookInfo.title.toString()),
              ],
            ).paddingOnly(top: 4),
            Row(
              children: [
                Text('Автор: '),
                Text(bookInfo.author),
              ],
            ).paddingOnly(top: 4),
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
            Row(
              children: [
                Text('Кол-во страниц: '),
                Text(bookInfo.pageCount.toString()),
              ],
            ).paddingOnly(top: 4),
          ],
        ).paddingOnly(left: 10),
      ],
    ).paddingSymmetric(vertical: 8, horisontal: 16);
  }

}
