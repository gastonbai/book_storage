import 'package:book_storage/features/library/widgets/short_book_info.dart';
import 'package:flutter/cupertino.dart';

import '../cubit/library_state.dart';

class LibraryLoadedView extends StatefulWidget {
  final LibraryLoadedState state;

  const LibraryLoadedView({
    super.key,
    required this.state,
  });

  @override
  State<LibraryLoadedView> createState() => _LibraryLoadedViewState();
}

class _LibraryLoadedViewState extends State<LibraryLoadedView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.state.books.length,
      itemBuilder: (context, index) {
        return BookShortInfoWidget(
          bookInfo: widget.state.books[index],
        );
      },
    );
  }
}
