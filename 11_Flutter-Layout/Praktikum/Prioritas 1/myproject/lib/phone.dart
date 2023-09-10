import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MaterialApp'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(title: Text('Home')),
            ListTile(
              title: Text('Settings'),
            )
          ],
        ),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade400,
              child: const Text('L'),
            ),
            title: const Text('Leanne Graham'),
            subtitle: const Text('1-770-736-8031 x56442'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade400,
              child: const Text('E'),
            ),
            title: const Text('Ervin Howell'),
            subtitle: const Text('010-692-6593 x09125'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade400,
              child: const Text('C'),
            ),
            title: const Text('Clementine Bauch'),
            subtitle: const Text('1-463-123-4447'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade400,
              child: const Text('P'),
            ),
            title: const Text('Patricia Lebsack'),
            subtitle: const Text('493-170-9623 x156'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade400,
              child: const Text('C'),
            ),
            title: const Text('Chelsey Dietrich'),
            subtitle: const Text('(254)954-1289'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade400,
              child: const Text('M'),
            ),
            title: const Text('Mrs. Dennis Schulist'),
            subtitle: const Text('1-477-935-8478 x6430'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade400,
              child: const Text('K'),
            ),
            title: const Text('Kurtis Weissnat'),
            subtitle: const Text('210.067.6132'),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
