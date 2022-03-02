/*
 * @Author: micki 
 * @Date: 2022-03-02 15:07:27 
 * @Last Modified by: micki
 * @Last Modified time: 2022-03-02 15:39:44
 * http
 */
import 'dart:developer';

import 'package:dio/dio.dart';

class Http {
  static Dio? _dio;
  static Dio _getDio() {
    _dio ??= Dio();
    _dio?.options.baseUrl = 'https://wanandroid.com/';
    return _dio!;
  }

  static Future<Response> get(String url, String? tag,
      {Map<String, dynamic>? queryParam}) async {
    final response = await _getDio().get(url, queryParameters: queryParam);
    log(tag ?? '' ': ' + response.data.toString());
    return response;
  }

  static Future<Response> post(String url, String? tag, dynamic data,
      {Map<String, dynamic>? queryParam}) async {
    final response =
        await _getDio().post(url, queryParameters: queryParam, data: data);
    log(tag ?? '' ': ' + response.data.toString());
    return response;
  }
}
