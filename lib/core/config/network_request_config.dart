import 'dart:convert';
import 'package:dio/dio.dart';

class NetworkRequestConfig {
  static const String _baseUrl = 'http://code.aldipee.com';
  Dio dio = Dio(BaseOptions(baseUrl: _baseUrl));

  Future<Map<String, dynamic>> doGet(String endPoint) async {
  var response = await dio.get(endPoint);

  if (response.runtimeType == String) {
    return jsonDecode(response.data);
  }

  return response.data;
 }
}
