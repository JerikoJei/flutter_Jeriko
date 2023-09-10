import 'package:flutter/material.dart';
import 'package:myproject/my_flutter_search.dart';

class MyflutterPage extends StatefulWidget {
  const MyflutterPage({super.key});

  @override
  State<MyflutterPage> createState() => _MyflutterPageState();
}

class _MyflutterPageState extends State<MyflutterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My FLutter App'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: ListView(children: const <Widget>[
          ListTile(
            title: Text(
              'Learn Flutter',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.black,
            thickness: 0.1,
          ),
          ListTile(
            title: Text(
              'Learn ReactJS',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.black,
            thickness: 0.1,
          ),
          ListTile(
            title: Text(
              'Learn VueJS',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.black,
            thickness: 0.1,
          ),
          ListTile(
            title: Text(
              'Learn Tailwind CSS',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.black,
            thickness: 0.1,
          ),
          ListTile(
            title: Text(
              'Learn UI/UX',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.black,
            thickness: 0.1,
          ),
          ListTile(
            title: Text(
              'Learn Figma',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.black,
            thickness: 0.1,
          ),
          ListTile(
            title: Text(
              'Learn Digital Marketing',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.black,
            thickness: 0.1,
          ),
        ]),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF6200ee),
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0xFF03DAC5),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Infomartion'),
        ],
      ),
    );
  }
}
