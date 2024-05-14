import 'dart:convert';

class EventUserModel {
  final String message;
  final dynamic eventid;
  final bool status;
  final int id;
  final String useruniqueid;
  final String qrCode;
  final String doctorName;
  final String email;
  final List<EventId> eventIds;

  EventUserModel({
    required this.message,
    required this.eventid,
    required this.status,
    required this.id,
    required this.useruniqueid,
    required this.qrCode,
    required this.doctorName,
    required this.email,
    required this.eventIds,
  });

  factory EventUserModel.fromJson(String str) =>
      EventUserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventUserModel.fromMap(Map<String, dynamic> json) => EventUserModel(
        message: json["Message"],
        eventid: json["eventid"],
        status: json["Status"],
        id: json["id"],
        useruniqueid: json["Useruniqueid"],
        qrCode: json["QrCode"],
        doctorName: json["DoctorName"],
        email: json["Email"],
        eventIds:
            List<EventId>.from(json["EventIds"].map((x) => EventId.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Message": message,
        "eventid": eventid,
        "Status": status,
        "id": id,
        "Useruniqueid": useruniqueid,
        "QrCode": qrCode,
        "DoctorName": doctorName,
        "Email": email,
        "EventIds": List<dynamic>.from(eventIds.map((x) => x.toMap())),
      };
}

class EventId {
  final int id;
  final int userId;
  final int eventId;
  final dynamic dateTime;
  final bool isActive;

  EventId({
    required this.id,
    required this.userId,
    required this.eventId,
    required this.dateTime,
    required this.isActive,
  });

  factory EventId.fromJson(String str) => EventId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventId.fromMap(Map<String, dynamic> json) => EventId(
        id: json["Id"],
        userId: json["UserId"],
        eventId: json["EventId"],
        dateTime: json["DateTime"],
        isActive: json["IsActive"],
      );

  Map<String, dynamic> toMap() => {
        "Id": id,
        "UserId": userId,
        "EventId": eventId,
        "DateTime": dateTime,
        "IsActive": isActive,
      };
}
