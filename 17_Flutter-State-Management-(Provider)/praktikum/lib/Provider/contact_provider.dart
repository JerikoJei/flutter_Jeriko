import 'package:flutter/material.dart';

class Contact with ChangeNotifier {
  List<Map<String, String>> _contact = [];
  List<Map<String, String>> get contacts => _contact;

  void addContact(Map<String, String> contact) {
    _contact.add(contact);
    notifyListeners();
  }
}
