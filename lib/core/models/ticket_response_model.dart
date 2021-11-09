import 'dart:convert';

import 'package:booking_yatch_agency/core/constants/app_constants.dart';

TicketResponse ticketResponseFromJson(String str) =>
    TicketResponse.fromJson(json.decode(str));

String ticketResponseToJson(TicketResponse data) => json.encode(data.toJson());

class TicketResponse {
  TicketResponse({
    this.data = const [],
  });

  List<Ticket> data;

  factory TicketResponse.fromJson(Map<String, dynamic> json) => TicketResponse(
        data: List<Ticket>.from(json["data"].map((x) => Ticket.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Ticket {
  Ticket({
    this.id = AppConstants.defaultGuid,
    this.nameCustomer = AppConstants.defaultString,
    this.phone = AppConstants.defaultString,
    this.idOrder = AppConstants.defaultGuid,
    this.idTicketType = AppConstants.defaultGuid,
    this.idTrip = AppConstants.defaultGuid,
    this.price = AppConstants.defaultDouble,
    this.status = AppConstants.defaultInt,
    this.qr = AppConstants.defaultString,
  });

  String id;
  String nameCustomer;
  String phone;
  String idOrder;
  String idTicketType;
  String idTrip;
  double price;
  int status;
  String qr;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"] ?? AppConstants.defaultGuid,
        nameCustomer: json["nameCustomer"] ?? AppConstants.defaultString,
        phone: json["phone"] ?? AppConstants.defaultString,
        idOrder: json["idOrder"] ?? AppConstants.defaultGuid,
        idTicketType: json["idTicketType"] ?? AppConstants.defaultGuid,
        idTrip: json["idTrip"] ?? AppConstants.defaultGuid,
        price: json["price"] ?? AppConstants.defaultDouble,
        status: json["status"] ?? AppConstants.defaultInt,
        qr: json["qr"] ?? AppConstants.defaultString,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameCustomer": nameCustomer,
        "phone": phone,
        "idOrder": idOrder,
        "idTicketType": idTicketType,
        "idTrip": idTrip,
        "price": price,
        "status": status,
        "qr": qr,
      };
}
