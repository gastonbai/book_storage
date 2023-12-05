import 'package:flutter/material.dart';
import '../pages/library_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '545',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        // primaryColor: Color.fromRGBO(10, 17, 58, 1),
      ),
      home:const LibraryPage(
          title: 'Мои прочитанные книги',
      ),
    );
  }
}