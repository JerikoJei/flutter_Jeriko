import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum/Screens/contacts_screen.dart';
import 'package:praktikum/Screens/gallery_screen.dart';
import 'package:praktikum/Screens/image_screen.dart';
import 'package:praktikum/bloc/contacts_bloc.dart';

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
        'phone': (context) => BlocProvider<ContactsBloc>(
              create: (context) => ContactsBloc(),
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
