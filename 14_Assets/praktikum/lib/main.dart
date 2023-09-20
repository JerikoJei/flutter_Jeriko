import 'package:flutter/material.dart';
import 'package:praktikum/gallery.dart';
import 'package:praktikum/home_screen.dart';
import 'package:praktikum/image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const MyGallery(),
        'contact': (_) => const MyHomeScreen(),
        'image': (_) => const MyImage()
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.deepPurple),
      ),
    );
  }
}
