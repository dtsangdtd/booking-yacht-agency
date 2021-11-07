import 'dart:convert';

import 'package:booking_yatch_agency/core/constants/app_constants.dart';

BusinessToursResponse businessToursResponseFromJson(String str) =>
    BusinessToursResponse.fromJson(json.decode(str));

String businessToursResponseToJson(BusinessToursResponse data) =>
    json.encode(data.toJson());

class BusinessToursResponse {
  BusinessToursResponse({
    this.data = const [],
  });

  List<BusinessTour> data;

  factory BusinessToursResponse.fromJson(Map<String, dynamic> json) =>
      BusinessToursResponse(
        data: List<BusinessTour>.from(
            json["data"].map((x) => BusinessTour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BusinessTour {
  BusinessTour({
    this.id = AppConstants.defaultGuid,
    this.idBusiness = AppConstants.defaultGuid,
    this.idTour = AppConstants.defaultGuid,
    this.status = AppConstants.defaultInt,
    this.idBusinessNavigation,
    this.idTourNavigation,
    this.ticketTypes = const [],
    this.trips = const [],
  });

  String id;
  String idBusiness;
  String idTour;
  int status;
  IdBusinessNavigation? idBusinessNavigation;
  IdTourNavigation? idTourNavigation;
  List<TicketType> ticketTypes;
  List<Trip> trips;

  factory BusinessTour.fromJson(Map<String, dynamic> json) => BusinessTour(
        id: json["id"] ?? AppConstants.defaultGuid,
        idBusiness: json["idBusiness"] ?? AppConstants.defaultGuid,
        idTour: json["idTour"] ?? AppConstants.defaultGuid,
        status: json["status"] ?? AppConstants.defaultInt,
        idBusinessNavigation:
            IdBusinessNavigation.fromJson(json["idBusinessNavigation"]),
        idTourNavigation: IdTourNavigation.fromJson(json["idTourNavigation"]),
        ticketTypes: List<TicketType>.from(
            json["ticketTypes"].map((x) => TicketType.fromJson(x))),
        trips: List<Trip>.from(json["trips"].map((x) => Trip.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idBusiness": idBusiness,
        "idTour": idTour,
        "status": status,
        "idBusinessNavigation": idBusinessNavigation?.toJson(),
        "idTourNavigation": idTourNavigation?.toJson(),
        "ticketTypes": List<dynamic>.from(ticketTypes.map((x) => x.toJson())),
        "trips": List<dynamic>.from(trips.map((x) => x.toJson())),
      };
}

class IdBusinessNavigation {
  IdBusinessNavigation({
    this.id = AppConstants.defaultGuid,
    this.uid,
    this.name = AppConstants.defaultString,
    this.emailAddress = AppConstants.defaultString,
    this.password,
    this.salt,
    this.phoneNumber = AppConstants.defaultString,
    this.photoUrl,
    this.address = AppConstants.defaultString,
    this.status = AppConstants.defaultInt,
    this.vnpTmnCode = AppConstants.defaultString,
    this.vnpHashSecret = AppConstants.defaultString,
    this.fcmToken = AppConstants.defaultString,
  });

  String id;
  dynamic uid;
  String name;
  String emailAddress;
  dynamic password;
  dynamic salt;
  String phoneNumber;
  dynamic photoUrl;
  String address;
  int status;
  String vnpTmnCode;
  String vnpHashSecret;
  String fcmToken;

  factory IdBusinessNavigation.fromJson(Map<String, dynamic> json) =>
      IdBusinessNavigation(
        id: json["id"] ?? AppConstants.defaultGuid,
        uid: json["uid"],
        name: json["name"] ?? AppConstants.defaultString,
        emailAddress: json["emailAddress"] ?? AppConstants.defaultString,
        password: json["password"],
        salt: json["salt"],
        phoneNumber: json["phoneNumber"] ?? AppConstants.defaultString,
        photoUrl: json["photoUrl"] ?? AppConstants.defaultNetworkImageUrl,
        address: json["address"] ?? AppConstants.defaultString,
        status: json["status"] ?? AppConstants.defaultInt,
        vnpTmnCode: json["vnpTmnCode"] ?? AppConstants.defaultString,
        vnpHashSecret: json["vnpHashSecret"] ?? AppConstants.defaultString,
        fcmToken: json["fcmToken"] ?? AppConstants.defaultString,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "name": name,
        "emailAddress": emailAddress,
        "password": password,
        "salt": salt,
        "phoneNumber": phoneNumber,
        "photoUrl": photoUrl,
        "address": address,
        "status": status,
        "vnpTmnCode": vnpTmnCode,
        "vnpHashSecret": vnpHashSecret,
        "fcmToken": fcmToken,
      };
}

class IdTourNavigation {
  IdTourNavigation({
    this.id = AppConstants.defaultGuid,
    this.title = AppConstants.defaultString,
    this.descriptions = AppConstants.defaultString,
    this.status = AppConstants.defaultInt,
    this.imageLink = AppConstants.defaultNetworkImageUrl,
  });

  String id;
  String title;
  String descriptions;
  int status;
  String imageLink;

  factory IdTourNavigation.fromJson(Map<String, dynamic> json) =>
      IdTourNavigation(
        id: json["id"] ?? AppConstants.defaultGuid,
        title: json["title"] ?? AppConstants.defaultString,
        descriptions: json["descriptions"] ?? AppConstants.defaultString,
        status: json["status"] ?? AppConstants.defaultInt,
        imageLink: json["imageLink"] ?? AppConstants.defaultNetworkImageUrl,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "descriptions": descriptions,
        "status": status,
        "imageLink": imageLink,
      };
}

class TicketType {
  TicketType({
    this.id = AppConstants.defaultGuid,
    this.name = AppConstants.defaultString,
    this.price = AppConstants.defaultDouble,
    this.status = AppConstants.defaultInt,
    this.commissionFeePercentage = AppConstants.defaultDouble,
    this.serviceFeePercentage = AppConstants.defaultDouble,
    this.idBusinessTour = AppConstants.defaultGuid,
    this.idBusinessTourNavigation,
  });

  String id;
  String name;
  double price;
  int status;
  double commissionFeePercentage;
  double serviceFeePercentage;
  String idBusinessTour;
  dynamic idBusinessTourNavigation;

  factory TicketType.fromJson(Map<String, dynamic> json) => TicketType(
        id: json["id"] ?? AppConstants.defaultGuid,
        name: json["name"] ?? AppConstants.defaultString,
        price: json["price"] ?? AppConstants.defaultDouble,
        status: json["status"] ?? AppConstants.defaultInt,
        commissionFeePercentage:
            json["commissionFeePercentage"] ?? AppConstants.defaultDouble,
        serviceFeePercentage:
            json["serviceFeePercentage"] ?? AppConstants.defaultDouble,
        idBusinessTour: json["idBusinessTour"] ?? AppConstants.defaultGuid,
        idBusinessTourNavigation: json["idBusinessTourNavigation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "status": status,
        "commissionFeePercentage": commissionFeePercentage,
        "serviceFeePercentage": serviceFeePercentage,
        "idBusinessTour": idBusinessTour,
        "idBusinessTourNavigation": idBusinessTourNavigation,
      };
}

class Trip {
  Trip({
    this.id = AppConstants.defaultGuid,
    this.time,
    this.idBusinessTour = AppConstants.defaultGuid,
    this.idVehicle = AppConstants.defaultGuid,
    this.status = AppConstants.defaultInt,
    this.idTour = AppConstants.defaultGuid,
    this.idBusiness = AppConstants.defaultGuid,
    this.amountTicket = AppConstants.defaultInt,
    this.orders,
    this.idVehicleNavigation,
  });

  String id;
  DateTime? time;
  String idBusinessTour;
  String idVehicle;
  int status;
  String idTour;
  String idBusiness;
  int amountTicket;
  dynamic orders;
  IdVehicleNavigation? idVehicleNavigation;

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        id: json["id"] ?? AppConstants.defaultGuid,
        time: DateTime.parse(json["time"]),
        idBusinessTour: json["idBusinessTour"] ?? AppConstants.defaultString,
        idVehicle: json["idVehicle"] ?? AppConstants.defaultString,
        status: json["status"] ?? AppConstants.defaultInt,
        idTour: json["idTour"] ?? AppConstants.defaultString,
        idBusiness: json["idBusiness"] ?? AppConstants.defaultString,
        amountTicket: json["amountTicket"] ?? AppConstants.defaultInt,
        orders: json["orders"],
        idVehicleNavigation:
            IdVehicleNavigation.fromJson(json["idVehicleNavigation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time": time?.toIso8601String(),
        "idBusinessTour": idBusinessTour,
        "idVehicle": idVehicle,
        "status": status,
        "idTour": idTour,
        "idBusiness": idBusiness,
        "amountTicket": amountTicket,
        "orders": orders,
        "idVehicleNavigation": idVehicleNavigation?.toJson(),
      };
}

class IdVehicleNavigation {
  IdVehicleNavigation({
    this.id = AppConstants.defaultGuid,
    this.name = AppConstants.defaultString,
    this.registrationNumber = AppConstants.defaultString,
    this.yearOfManufacture = 1,
    this.whereProduction = AppConstants.defaultString,
    this.seat = AppConstants.defaultInt,
    this.descriptions = AppConstants.defaultString,
    this.idVehicleType = AppConstants.defaultString,
    this.idBusiness = AppConstants.defaultString,
    this.status = AppConstants.defaultInt,
    this.imageLink = AppConstants.defaultNetworkImageUrl,
    this.idBusinessNavigation = AppConstants.defaultString,
    this.idVehicleTypeNavigation,
  });

  String id;
  String name;
  String registrationNumber;
  int yearOfManufacture;
  String whereProduction;
  int seat;
  String descriptions;
  String idVehicleType;
  String idBusiness;
  int status;
  String imageLink;
  dynamic idBusinessNavigation;
  IdVehicleTypeNavigation? idVehicleTypeNavigation;

  factory IdVehicleNavigation.fromJson(Map<String, dynamic> json) =>
      IdVehicleNavigation(
        id: json["id"] ?? AppConstants.defaultGuid,
        name: json["name"] ?? AppConstants.defaultString,
        registrationNumber:
            json["registrationNumber"] ?? AppConstants.defaultString,
        yearOfManufacture: json["yearOfManufacture"] ?? AppConstants.defaultInt,
        whereProduction: json["whereProduction"] ?? AppConstants.defaultString,
        seat: json["seat"] ?? AppConstants.defaultInt,
        descriptions: json["descriptions"] ?? AppConstants.defaultString,
        idVehicleType: json["idVehicleType"] ?? AppConstants.defaultString,
        idBusiness: json["idBusiness"] ?? AppConstants.defaultString,
        status: json["status"] ?? AppConstants.defaultInt,
        imageLink: json["imageLink"] ?? AppConstants.defaultString,
        idBusinessNavigation:
            json["idBusinessNavigation"] ?? AppConstants.defaultString,
        idVehicleTypeNavigation:
            IdVehicleTypeNavigation.fromJson(json["idVehicleTypeNavigation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "registrationNumber": registrationNumber,
        "yearOfManufacture": yearOfManufacture,
        "whereProduction": whereProduction,
        "seat": seat,
        "descriptions": descriptions,
        "idVehicleType": idVehicleType,
        "idBusiness": idBusiness,
        "status": status,
        "imageLink": imageLink,
        "idBusinessNavigation": idBusinessNavigation,
        "idVehicleTypeNavigation": idVehicleTypeNavigation?.toJson(),
      };
}

class IdVehicleTypeNavigation {
  IdVehicleTypeNavigation({
    this.id = AppConstants.defaultGuid,
    this.name = AppConstants.defaultString,
    this.status = AppConstants.defaultInt,
  });

  String id;
  String name;
  int status;

  factory IdVehicleTypeNavigation.fromJson(Map<String, dynamic> json) =>
      IdVehicleTypeNavigation(
        id: json["id"] ?? AppConstants.defaultGuid,
        name: json["name"] ?? AppConstants.defaultString,
        status: json["status"] ?? AppConstants.defaultInt,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
      };
}
