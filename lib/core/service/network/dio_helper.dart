// ignore_for_file: camel_case_types, non_constant_identifier_names, deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Dio_Helper {
  static Dio? dio;
  static init() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: 'http://api.alquran.cloud/v1/',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60), // 60 seconds
        receiveTimeout: const Duration(seconds: 60), // 60 seconds
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
      // 'Authorization': "Bearer $api_key",
      // 'Content-Type': 'application/json'
    };
    return dio!.post(url, queryParameters: query, data: data);
  }

  static Future getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {};

    try {
      return await dio!.get(url, queryParameters: query);
    }  catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.connectionTimeout) {
          throw Exception('connection timeout error ');
        } else if (e.error is SocketException) {
          debugPrint("Error SocketException");
        }else if(e.type == DioErrorType.connectionError){
          debugPrint("Error connection error");
        }else{
          debugPrint("Error $e");
        }
      }
      // throw Exception(e.toString());
    }
  }
}
