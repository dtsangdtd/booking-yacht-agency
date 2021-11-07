import 'dart:convert';

import 'package:booking_yatch_agency/core/constants/app_constants.dart';

ToursResponse toursResponseFromJson(String str) =>
    ToursResponse.fromJson(json.decode(str));

String toursResponseToJson(ToursResponse data) => json.encode(data.toJson());

class ToursResponse {
  ToursResponse({
    this.data = const [],
  });

  List<Tour> data;

  factory ToursResponse.fromJson(Map<String, dynamic> json) => ToursResponse(
        data: List<Tour>.from(json["data"].map((x) => Tour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Tour {
  Tour({
    this.id = AppConstants.defaultGuid,
    this.tittle = AppConstants.defaultString,
    this.descriptions = AppConstants.defaultString,
    this.status = 0,
    this.imageLink = AppConstants.defaultNetworkImageUrl,
    this.destinationTours,
  });

  String id;
  String tittle;
  String descriptions;
  int status;
  String imageLink;
  dynamic destinationTours;

  factory Tour.fromJson(Map<String, dynamic> json) => Tour(
        id: json["id"],
        tittle: json["tittle"] ?? AppConstants.defaultString,
        descriptions: json["descriptions"] ?? AppConstants.defaultString,
        status: json["status"] ?? 0,
        imageLink: json["imageLink"] ?? AppConstants.defaultNetworkImageUrl,
        destinationTours: json["destinationTours"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tittle": tittle,
        "descriptions": descriptions,
        "status": status,
        "imageLink": imageLink,
        "destinationTours": destinationTours,
      };
}
