import 'dart:convert';

import 'package:booking_yatch_agency/core/constants/app_constants.dart';

DestinationToursResponse destinationToursResponseFromJson(String str) =>
    DestinationToursResponse.fromJson(json.decode(str));

String destinationToursResponseToJson(DestinationToursResponse data) =>
    json.encode(data.toJson());

class DestinationToursResponse {
  DestinationToursResponse({
    this.data = const [],
  });

  List<DestinationTour> data;

  factory DestinationToursResponse.fromJson(Map<String, dynamic> json) =>
      DestinationToursResponse(
        data: List<DestinationTour>.from(
            json["data"].map((x) => DestinationTour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DestinationTour {
  DestinationTour({
    this.id = AppConstants.defaultGuid,
    this.idDestination = AppConstants.defaultGuid,
    this.idTour = AppConstants.defaultGuid,
    this.order = 0,
    this.destination,
    this.placeType,
  });

  String id;
  String idDestination;
  String idTour;
  int order;
  Destination? destination;
  dynamic placeType;

  factory DestinationTour.fromJson(Map<String, dynamic> json) =>
      DestinationTour(
        id: json["id"],
        idDestination: json["idDestination"],
        idTour: json["idTour"],
        order: json["order"],
        destination: Destination.fromJson(json["destination"]),
        placeType: json["placeType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idDestination": idDestination,
        "idTour": idTour,
        "order": order,
        "destination": destination?.toJson(),
        "placeType": placeType,
      };
}

class Destination {
  Destination({
    this.id = AppConstants.defaultGuid,
    this.name = AppConstants.defaultString,
    this.address = AppConstants.defaultString,
    this.location = AppConstants.defaultString,
    this.idPlaceType = AppConstants.defaultGuid,
    this.status = 0,
    this.idPlaceTypeNavigation,
  });

  String id;
  String name;
  String address;
  dynamic location;
  String idPlaceType;
  int status;
  IdPlaceTypeNavigation? idPlaceTypeNavigation;

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        location: json["location"],
        idPlaceType: json["idPlaceType"],
        status: json["status"],
        idPlaceTypeNavigation:
            IdPlaceTypeNavigation.fromJson(json["idPlaceTypeNavigation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "location": location,
        "idPlaceType": idPlaceType,
        "status": status,
        "idPlaceTypeNavigation": idPlaceTypeNavigation?.toJson(),
      };
}

class IdPlaceTypeNavigation {
  IdPlaceTypeNavigation({
    this.id = AppConstants.defaultGuid,
    this.name = AppConstants.defaultString,
    this.status = 0,
  });

  String id;
  String name;
  int status;

  factory IdPlaceTypeNavigation.fromJson(Map<String, dynamic> json) =>
      IdPlaceTypeNavigation(
        id: json["id"],
        name: json["name"] ?? AppConstants.defaultString,
        status: json["status"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
      };
}
