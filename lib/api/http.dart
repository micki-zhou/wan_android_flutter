/*
 * @Author: micki 
 * @Date: 2022-03-02 15:07:27 
 * @Last Modified by: micki
 * @Last Modified time: 2022-03-03 16:55:40
 * http
 */
import 'dart:developer';

import 'package:dio/dio.dart';

class Http {
  static Dio? _dio;
  static Dio _getDio() {
    _dio ??= Dio();
    _dio?.options.baseUrl = 'https://wanandroid.com/';
    _dio?.options.connectTimeout = 10000;
    // _dio?.options.contentType = 'application/json;charset=UTF-8';
    return _dio!;
  }

  static Future<Response> get(String url, String tag,
      {Map<String, dynamic>? queryParam}) async {
    final response = await _getDio().get(url, queryParameters: queryParam);
    // log(tag + '---response: ' + response.data.toString());
    return response;
  }

  static Future<Response> post(String url, String tag,
      {dynamic data, Map<String, dynamic>? queryParam}) async {
    log(tag + '---body: ' + data.toString());
    var formData = FormData.fromMap(data);
    final response = await _getDio().post(
      url,
      queryParameters: queryParam,
      data: formData,
    );
    // log(tag + '---response: ' + response.data.toString());
    log('cookie: ' + response.headers.toString());

    return response;
  }
}
