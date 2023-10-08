import 'package:flutter/material.dart';
import 'package:praktikum/prio1/provider/register_provider.dart';
import 'package:praktikum/prio1/views/screen/register_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => RegisterProvider(),
        builder: (context, child) => const RegisterScreen(),
      ),
    );
  }
}
