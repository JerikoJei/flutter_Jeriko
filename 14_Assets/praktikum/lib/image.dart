import 'package:flutter/material.dart';

class MyImage extends StatefulWidget {
  final String value;
  const MyImage({super.key, required this.value});

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Your Image'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.network(widget.value),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
