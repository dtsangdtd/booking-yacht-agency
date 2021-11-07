import 'package:dio/dio.dart';

abstract class HttpService {
  void init();

  Future<Response> get(String url);
  Future<Response> post(String url, dynamic data);
}
