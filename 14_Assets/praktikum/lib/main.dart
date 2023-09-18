import 'package:flutter/material.dart';
import 'package:praktikum/gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.deepPurple),
      ),
      home: const MyGallery(),
    );
  }
}
