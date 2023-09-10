import 'package:flutter/cupertino.dart';
import './cupertino_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData.raw(
          Brightness.dark, null, null, null, null, null, null),
      home: MyHomePage(),
    );
  }
}
