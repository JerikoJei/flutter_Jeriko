import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/about_us.dart';
import 'package:project/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                title: TextButton(
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  child: Text(
                    'Contact Us',
                    style: GoogleFonts.actor(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(),
                        ));
                  },
                ),
              ),
              ListTile(
                title: TextButton(
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  child: Text(
                    'About Us',
                    style: GoogleFonts.actor(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutUs(),
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                title: TextButton(
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  child: Text(
                    'Login',
                    style: GoogleFonts.actor(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Jeriko's App",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(37, 96, 125, 139),
                label: Text('Username'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(37, 96, 125, 139),
                label: Text('Password'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        )),
      ),
    );
  }
}
