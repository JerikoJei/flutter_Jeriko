import 'package:flutter/material.dart';
import 'package:praktikum/Provider/model.dart';

class ContactProvider with ChangeNotifier {
  final List<GetContact> _contact = [];
  List<GetContact> get contacts => _contact;

  void addContact(GetContact contact) {
    _contact.add(contact);
    notifyListeners();
  }

  void updateContact(int index, name, nomor) {
    _contact[index].name = name;
    _contact[index].nomor = nomor;
    notifyListeners();
  }

  void deleteContact(int index) {
    _contact.removeAt(index);
    notifyListeners();
  }
}
