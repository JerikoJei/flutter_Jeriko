import 'package:flutter/material.dart';
import './my_fluttter_page.dart';

class Myflutter extends StatefulWidget {
  const Myflutter({super.key});

  @override
  State<Myflutter> createState() => _MyflutterState();
}

class _MyflutterState extends State<Myflutter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6200ee),
          secondary: const Color(0xFF03DAC5),
        ),
      ),
      home: const MyflutterPage(),
    );
  }
}
