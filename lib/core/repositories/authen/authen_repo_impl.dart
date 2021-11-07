import 'package:booking_yatch_agency/core/models/authen_response_model.dart';
import 'package:booking_yatch_agency/core/repositories/authen/authen_repo.dart';
import 'package:booking_yatch_agency/services/http_service.dart';
import 'package:booking_yatch_agency/services/http_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenRepoImpl extends AuthenRepo {
  late HttpService _httpService;

  AuthenRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
  }

  @override
  Future<AuthenResponse> signIn(String username, String password) async {
    try {
      final response = await _httpService
          .post('login', {'emailAddress': username, 'password': password});
      final parsedResponse = authenResponseFromJson(response.toString());
      return parsedResponse;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return AuthenResponse();
    }
  }

  @override
  Future<AuthenResponse> openSignIn(String idToken) async {
    try {
      final response =
          await _httpService.post('open-login', {'idToken': idToken});
      final parsedResponse = authenResponseFromJson(response.toString());
      return parsedResponse;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return AuthenResponse();
    }
  }

  @override
  Future<AuthenResponse> signUp(
      String name, String username, String password) async {
    try {
      final response = await _httpService.post('register',
          {'name': name, 'emailAddress': username, 'password': password});
      final parsedResponse = authenResponseFromJson(response.toString());
      return parsedResponse;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return AuthenResponse();
    }
  }
}
