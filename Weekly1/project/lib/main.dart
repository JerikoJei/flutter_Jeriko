import 'package:flutter/material.dart';
import 'package:project/page/home_page.dart';
import 'package:project/page/welcome_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jeriko's App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme),
      ),
      routes: {
        '/': (context) => const MyWelcomePage(),
        '/HomePage': (context) => const MyHomePage(),
      },
    );
  }
}
