import 'dart:convert';

class SpeakerModel {
    final int eventid;
    final int id;
    final String speakerName;
    final String speakerDesignation;
    final String speakerBio;
    final String speakerImage;
    final String speakerType;
    final dynamic imagePath;
    final int order;
    final dynamic orderId;

    SpeakerModel({
        required this.eventid,
        required this.id,
        required this.speakerName,
        required this.speakerDesignation,
        required this.speakerBio,
        required this.speakerImage,
        required this.speakerType,
        required this.imagePath,
        required this.order,
        required this.orderId,
    });

    factory SpeakerModel.fromJson(String str) => SpeakerModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SpeakerModel.fromMap(Map<String, dynamic> json) => SpeakerModel(
        eventid: json["Eventid"],
        id: json["id"],
        speakerName: json["speaker_name"],
        speakerDesignation: json["speaker_designation"],
        speakerBio: json["speaker_bio"],
        speakerImage: json["speaker_image"],
        speakerType: json["speaker_type"],
        imagePath: json["image_path"],
        order: json["Order"],
        orderId: json["OrderId"],
    );

    Map<String, dynamic> toMap() => {
        "Eventid": eventid,
        "id": id,
        "speaker_name": speakerName,
        "speaker_designation": speakerDesignation,
        "speaker_bio": speakerBio,
        "speaker_image": speakerImage,
        "speaker_type": speakerType,
        "image_path": imagePath,
        "Order": order,
        "OrderId": orderId,
    };
}
