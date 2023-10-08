import 'package:dio/dio.dart';
import 'package:praktikum/prio2/utils/utils.dart';

class ApiService {
  ApiService();
  final Dio _dio = Dio();

  Future<Response> picture(String name) async {
    try {
      final response = await _dio.get(Utils.baseurl + name);

      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
