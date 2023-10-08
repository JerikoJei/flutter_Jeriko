import 'package:flutter/material.dart';
import 'package:praktikum/prio2/provider/pic_provider.dart';
import 'package:praktikum/prio2/views/screen/image_generator.dart';
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
        create: (context) => PicProvider(),
        builder: (context, child) => const ImageGeneratorScreen(),
      ),
    );
  }
}
