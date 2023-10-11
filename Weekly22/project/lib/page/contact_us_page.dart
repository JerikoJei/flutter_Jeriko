import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _formKey = GlobalKey<FormState>();
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var email = TextEditingController();
  var problem = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact Us',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Working hard,\nor hardly working?',
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "We're hard at work for you.\nPlease Give us a feedback",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  controller: firstname,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3)),
                    label: const Text('First Name'),
                    filled: true,
                    fillColor: const Color(0xFFE7E0EC),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  controller: lastname,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3)),
                    label: const Text('Last Name'),
                    filled: true,
                    fillColor: const Color(0xFFE7E0EC),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) {
              // Check if this field is empty
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              // using regular expression
              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                return "Please enter a valid email address";
              }

              // the email is valid
              return null;
            },
            controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
              label: const Text('Your Email Address'),
              filled: true,
              fillColor: const Color(0xFFE7E0EC),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            maxLines: 7,
            controller: problem,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
              label: const Text('What can We help you?'),
              filled: true,
              fillColor: const Color(0xFFE7E0EC),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final fname = firstname.text;
                    final lname = lastname.text;
                    final emaill = email.text;
                    final prob = problem.text;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Submit Form',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              const Text(
                                'Nama Lengkap',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('$fname $lname'),
                              const Text(
                                'Alamat Email Anda',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(emaill),
                              const Text(
                                'Keluhan anda',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(prob),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Submit'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                child: const Text('Submit')),
          ),
        ],
      ),
    );
  }
}
