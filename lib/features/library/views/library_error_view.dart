
import 'package:flutter/material.dart';

import '../cubit/library_state.dart';

class LibraryErrorView extends StatelessWidget {
  final LibraryErrorState state;

  const LibraryErrorView({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(state.message),
    );
  }
}
