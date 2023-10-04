import 'package:dio/dio.dart';
import 'package:praktikum/models/register_model.dart';
import 'package:praktikum/utils/utils.dart';

class ApiService {
  ApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          if (e.response!.statusCode == 401) {
          } else {
            return handler.next(e);
          }
        },
      ),
    );
  }
  final Dio _dio = Dio();

  Future<RegisterModel> register({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        Utils.baseurl + Utils.register,
        data: {
          'email': email,
          'password': password,
        },
      );
      return RegisterModel.fromJson(
        response.data,
      );
    } on DioException catch (e) {
      e.message;
      rethrow;
    }
  }
}
