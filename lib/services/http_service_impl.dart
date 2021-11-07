import 'package:booking_yatch_agency/services/http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpServiceImpl implements HttpService {
  late Dio _dio;

  HttpServiceImpl() {
    init();
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
        onResponse: (response, handler) {
          debugPrint(
              "${response.statusCode} | ${response.statusMessage} | ${response.data}");
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
  void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://booking-yacht.azurewebsites.net/api/v1.0/agency/',
        headers: {'Authorization': 'Bearer KEY'},
      ),
    );
    initializeInterceptor();
  }
}
