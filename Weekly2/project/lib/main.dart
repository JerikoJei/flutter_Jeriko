import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/about_us.dart';
import 'package:project/view/home_page.dart';
import 'package:project/view/welcome_page.dart';

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
        '/about': (context) => const AboutUs(),
      },
    );
  }
}
