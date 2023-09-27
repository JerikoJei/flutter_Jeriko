import 'package:flutter/material.dart';
import 'package:praktikum/Screens/contacts_screen.dart';
import 'package:praktikum/Screens/gallery_screen.dart';
import 'package:praktikum/Screens/image_screen.dart';
import 'package:provider/provider.dart';

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
        'phone': (_) => Builder(
          builder: (context) {
            return const ContactScreen();
          }
        ),
        'gallery': (_) => const MyGallery(),
        'image': (_) => const MyImage()
      },
      initialRoute: 'phone',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.deepPurple),
      ),
    );
  }
}
