import 'dart:convert';

AuthenResponse authenResponseFromJson(String str) =>
    AuthenResponse.fromJson(json.decode(str));

String authenResponseToJson(AuthenResponse data) => json.encode(data.toJson());

class AuthenResponse {
  AuthenResponse({
    this.data = '',
    this.error = '',
  });

  String data;
  String error;

  factory AuthenResponse.fromJson(Map<String, dynamic> json) => AuthenResponse(
        data: json["data"] ?? '',
        error: json["error"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "error": error,
      };
}
