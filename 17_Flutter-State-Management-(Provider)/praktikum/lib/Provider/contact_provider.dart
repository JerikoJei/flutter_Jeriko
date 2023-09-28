import 'package:flutter/material.dart';
import 'package:praktikum/Provider/model.dart';

class ContactProvider with ChangeNotifier {
  final List<GetContact> _contact = [];
  List<GetContact> get contacts => _contact;

  void addContact(GetContact contact) {
    _contact.add(contact);
    notifyListeners();
  }
}
