import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:praktikum/prio1/models/register_model.dart';
import 'package:praktikum/prio1/models/state.dart';
import 'package:praktikum/prio1/services/services.dart';

class RegisterProvider extends ChangeNotifier {
  final ApiService service = ApiService();

  RegisterModel? users;

  MyState myState = MyState.initial;

  Future register({required String email, required String password}) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      users = await service.register(email: email, password: password);
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        e.response!.statusMessage;
      }

      myState = MyState.failed;
      notifyListeners();
    }
  }
}
