import 'package:flutter/material.dart';

class MyGallery extends StatefulWidget {
  const MyGallery({super.key});

  @override
  State<MyGallery> createState() => _MyGalleryState();
}

List<String> photos = [
  'https://media.istockphoto.com/id/1406698420/id/foto/taman-hijau.jpg?s=612x612&w=0&k=20&c=rR18e3sx_4KQyHjzWRuuLE5uABFpfkmLB-w3-d2FwfM=',
  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
  'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821_1280.jpg',
  'https://media.istockphoto.com/id/1021170914/id/foto/lanskap-yang-indah-di-taman-dengan-pohon-dan-padang-rumput-hijau-di-pagi-hari.jpg?s=2048x2048&w=is&k=20&c=invyAvFkWmh0AMzTViLa3kWe7y-IInC-qEWgBe05Fw4=',
];

class _MyGalleryState extends State<MyGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Your Gallery'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(top: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: photos.length,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 20),
                    height: 400,
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Image.network(
                          photos[index],
                          scale: 2,
                        ),
                        Text('Gambar ${index + 1}'),
                        const Text('Apakah Anda ingin menampilkan gambar ini?'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('image',
                                    arguments: photos[index]);
                              },
                              child: const Text('Ya'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: const Text('Tidak'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                photos[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  'gallery',
                );
              },
              child: const ListTile(
                title: Text('Gallery'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('phone');
              },
              child: const ListTile(
                title: Text('Contact'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
