// ignore_for_file: file_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:event_booking/model/event-model.dart';

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

  Future<List<EventModel>> getPostData() async {
    try {
      final response = await _dio.get("/posts");
      if (response.statusCode == 200) {
        List data = response.data;
        final event = data.map((e) => EventModel.fromJson(e)).toList();
        log("data length ${data.length}");
        return event;
      } else {
        throw Exception("Failed to load data");
      }
    } on DioException catch (e) {
      log("${e.message}");
      throw Exception("Failed to load data");
    }
  }
}
