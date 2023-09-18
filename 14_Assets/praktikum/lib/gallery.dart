import 'package:flutter/material.dart';

class MyGallery extends StatefulWidget {
  const MyGallery({super.key});

  @override
  State<MyGallery> createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Your Gallery'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: [
          Image.network(
            'https://media.istockphoto.com/id/1406698420/id/foto/taman-hijau.jpg?s=612x612&w=0&k=20&c=rR18e3sx_4KQyHjzWRuuLE5uABFpfkmLB-w3-d2FwfM=',
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://media.istockphoto.com/id/1021170914/id/foto/lanskap-yang-indah-di-taman-dengan-pohon-dan-padang-rumput-hijau-di-pagi-hari.jpg?s=2048x2048&w=is&k=20&c=invyAvFkWmh0AMzTViLa3kWe7y-IInC-qEWgBe05Fw4=',
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821_1280.jpg',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
