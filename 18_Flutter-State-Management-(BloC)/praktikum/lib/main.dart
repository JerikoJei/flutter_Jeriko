import 'package:flutter/material.dart';
import 'package:praktikum/Screens/contacts_screen.dart';
import 'package:praktikum/Screens/gallery_screen.dart';
import 'package:praktikum/Screens/image_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'phone': (context) => const ContactScreen(),
        'gallery': (context) => const MyGallery(),
        'image': (context) => const MyImage(),
      },
      initialRoute: 'phone',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.deepPurple),
      ),
    );
  }
}
