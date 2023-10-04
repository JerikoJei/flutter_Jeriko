import 'package:flutter/material.dart';
import 'package:praktikum/models/state.dart';
import 'package:praktikum/provider/register_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formkey1 = GlobalKey();

  TextEditingController emailCo = TextEditingController();
  TextEditingController passwordCo = TextEditingController();

  @override
  void initState() {
    final registeProvider =
        Provider.of<RegisterProvider>(context, listen: false);
    registeProvider.addListener(
      () {
        if (registeProvider.myState == MyState.failed) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Register Gagal'),
          ));
        } else if (registeProvider.myState == MyState.loaded) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Register Berhasil'),
          ));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final registeProvider =
        Provider.of<RegisterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Register Screen'), backgroundColor: Colors.indigo),
      body: Form(
        key: formkey1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: emailCo,
                decoration: InputDecoration(
                  label: const Text('Email'),
                  hintText: 'Input Your Email',
                  filled: true,
                  fillColor: Colors.indigo.withOpacity(0.5),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: passwordCo,
                decoration: InputDecoration(
                  label: const Text('Password'),
                  hintText: 'Input Your Password',
                  filled: true,
                  fillColor: Colors.indigo.withOpacity(0.5),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formkey1.currentState!.validate()) {
                    formkey1.currentState!.save();

                    registeProvider.register(
                        email: emailCo.text, password: passwordCo.text);
                  }
                },
                child: Consumer<RegisterProvider>(
                  builder: (context, registerProvider, circular) {
                    if (registerProvider.myState == MyState.loading) {
                      return circular!;
                    } else {
                      return const Text('Register');
                    }
                  },
                  child: const CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
