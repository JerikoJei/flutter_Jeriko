import 'package:flutter/material.dart';
import 'package:praktikum/Provider/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactProvider with ChangeNotifier {
  late SharedPreferences logindata;
  String username = '';
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

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    username = logindata.getString('username').toString();
    notifyListeners();
  }
}
