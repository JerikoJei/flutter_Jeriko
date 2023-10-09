import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:praktikum/prio2/utils/utils.dart';
import 'package:praktikum/prio2/models/state.dart';
import 'package:praktikum/prio2/services/servicess.dart';

class PicProvider extends ChangeNotifier {
  final ApiService service = ApiService();

  MyState myState = MyState.initial;

  Response? response;
  String image = '';

  Future picture(String name) async {
    try {
      myState = MyState.loading;
      image = '';
      notifyListeners();

      image = Utils.baseurl + name;
      notifyListeners();

      response = await service.picture(name);
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
