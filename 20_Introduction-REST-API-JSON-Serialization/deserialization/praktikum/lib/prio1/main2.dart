import 'package:dio/dio.dart';

void main() async {
  final Dio dio = Dio();

  final Map<String, dynamic> requestBody = {
    'id': 1,
    'title': 'foo',
    'body': 'bar',
    'userId': 1,
  };

  try {
    final response = await dio.put(
      //Endpoint
      'https://jsonplaceholder.typicode.com/posts/1',
      // Data request body
      data: requestBody,
    );

    if (response.statusCode == 200) {
      print('PUT Request Berhasil');
      print('Response Data: ${response.data}');
    } else {
      print('PUT Request Gagal');
    }
  } catch (e) {
    print('Error: $e');
  }
}
