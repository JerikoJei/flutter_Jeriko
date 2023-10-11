import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Working hard,\nor hardly working?',
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "We're hard at work for you.\nPlease Give us a feedback",
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
