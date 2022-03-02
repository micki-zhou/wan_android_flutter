/*
 * @Author: micki 
 * @Date: 2022-03-02 12:31:37 
 * @Last Modified by: micki
 * @Last Modified time: 2022-03-02 12:44:33
 * 网络工具
 */
// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';

void get(String url, String tag) async {
  try {
    var response = await Dio().get(url);
    log(tag + ' --------- ' + response.data.toString());
  } catch (e) {
    log(tag + ' --------- ' + e.toString());
  }
}
