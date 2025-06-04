import 'dart:developer';

import 'package:dio/dio.dart';

class APIClass {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<List<dynamic>> getPostData() async {
    try {
      final response = await _dio.get("/posts");
      if (response.statusCode == 200) {
        log("${response.data}");
        return response.data;
      } else {
        throw Exception("Failed to load data");
      }
    } on DioException catch (e) {
      log("${e.message}");
      throw Exception("Failed to load data");
    }
  }
}
