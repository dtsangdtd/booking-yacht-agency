import 'dart:convert';

DataResponse dataResponseFromJson(String str) =>
    DataResponse.fromJson(json.decode(str));

String dataResponseToJson(DataResponse data) => json.encode(data.toJson());

class DataResponse {
  DataResponse({
    this.data = '',
    this.error = '',
  });

  String data;
  String error;

  factory DataResponse.fromJson(Map<String, dynamic> json) => DataResponse(
        data: json["data"] ?? '',
        error: json["error"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "error": error,
      };
}
