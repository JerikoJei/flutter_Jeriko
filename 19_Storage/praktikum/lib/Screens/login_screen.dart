import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late SharedPreferences logindata;
  late bool newUser;

  final _username = TextEditingController();
  final _password = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checklogin();
  }

  void checklogin() async {
    logindata = await SharedPreferences.getInstance();
    newUser = logindata.getBool('Login') ?? true;

    if (newUser == false) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(context, 'phone', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Hello, Welcome To My Page',
                style: GoogleFonts.capriola(
                    fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3)),
                  label: const Text('Username'),
                  hintText: 'Input your Username',
                  filled: true,
                  fillColor: const Color(0xFFE7E0EC),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3)),
                  label: const Text('Password'),
                  hintText: 'Input your password',
                  filled: true,
                  fillColor: const Color(0xFFE7E0EC),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  final isValidForm = formkey.currentState!.validate();

                  String username = _username.text;
                  if (isValidForm) {
                    logindata.setBool('login', false);
                    logindata.setString('username', username);
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'phone', (route) => false);
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                child: const Text('Login'),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
