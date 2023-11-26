// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:dio/dio.dart';

class Adhan_Dio_Helper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        validateStatus: (status) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        baseUrl: 'http://api.aladhan.com/v1/',
        receiveDataWhenStatusError: true,
        headers: {
          // 'Content-Type': 'application/json',
        },
      ),
    );
  }
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers = {
    };
    return dio!.post(url, queryParameters: query, data: data);
  }

    static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
    };
    return await dio!.get(url, queryParameters: query);
  }
}