import 'package:flutter/material.dart';
import 'package:praktikum/Screens/contacts_screen.dart';
import 'package:praktikum/Screens/gallery_screen.dart';
import 'package:praktikum/Screens/image_screen.dart';
import 'package:provider/provider.dart';
import 'package:praktikum/Provider/contact_provider.dart' as contact_store;

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
        'phone': (context) => ChangeNotifierProvider(
              create: (BuildContext context) => contact_store.ContactProvider(),
              child: const ContactScreen(),
            ),
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
