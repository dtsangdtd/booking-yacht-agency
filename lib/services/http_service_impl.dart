import 'package:booking_yatch_agency/services/http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpServiceImpl implements HttpService {
  late Dio _dio;

  HttpServiceImpl() {
    init();
  }

  loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwtToken');
    _dio.options.headers["Authorization"] = "Bearer $token";
  }

  @override
  Future<Response> get(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
    } on Exception catch (error) {
      debugPrint(error.toString());
      throw Exception(error.toString());
    }
    return response;
  }

  @override
  Future<Response> post(String url, dynamic data) async {
    Response response;
    try {
      response = await _dio.post(url, data: data);
    } on Exception catch (error) {
      debugPrint(error.toString());
      throw Exception(error.toString());
    }
    return response;
  }

  initializeInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint(
              '${options.method} | ${options.baseUrl}${options.path} \n ${options.data}');
          return handler.next(options); //continue
        },
        onResponse: (response, handler) async {
          debugPrint(
              "${response.statusCode} | ${response.statusMessage} | ${response.data}");

          if (response.statusCode == 401) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove('jwtToken');
          }

          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          debugPrint(e.message);
          return handler.next(e); //continue
        },
      ),
    );
  }

  @override
  void init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://booking-yacht.azurewebsites.net/api/v1.0/agency/',
      ),
    );
    initializeInterceptor();
  }
}
