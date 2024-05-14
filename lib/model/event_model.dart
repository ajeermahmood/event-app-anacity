import 'dart:convert';

class EventModel {
  final int id;
  final int eventid;
  final String title;
  final DateTime date;
  final String time;
  final dynamic starttime;
  final dynamic endtime;
  final String topic;
  final String speakerName;
  final String day;
  final String specialcell;
  final String injection;

  EventModel({
    required this.id,
    required this.eventid,
    required this.title,
    required this.date,
    required this.time,
    required this.starttime,
    required this.endtime,
    required this.topic,
    required this.speakerName,
    required this.day,
    required this.specialcell,
    required this.injection,
  });

  factory EventModel.fromJson(String str) =>
      EventModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventModel.fromMap(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        eventid: json["Eventid"],
        title: json["Title"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        starttime: json["Starttime"],
        endtime: json["Endtime"],
        topic: json["topic"],
        speakerName: json["speaker_name"],
        day: json["day"],
        specialcell: json["specialcell"],
        injection: json["injection"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "Eventid": eventid,
        "Title": title,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "Starttime": starttime,
        "Endtime": endtime,
        "topic": topic,
        "speaker_name": speakerName,
        "day": day,
        "specialcell": specialcell,
        "injection": injection,
      };
}
