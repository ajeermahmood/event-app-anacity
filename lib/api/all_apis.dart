import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:event_app_anacity/model/event_model.dart';
import 'package:event_app_anacity/model/speaker_model.dart';
import 'package:event_app_anacity/model/user_model.dart';

class ApiClass {
  static const baseUrl = 'https://ldb-me.ve-live.com/api/AdminApiProvider';

  static const askQuestionUrl =
      'https://ldb-me.event-loreal.com/api/AdminApiProvider/AskQuestion';

  final dio = Dio();

  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////

  Future<dynamic> registerUser(Map<String, dynamic> data) async {
    var url = "$baseUrl/RegisterUser";

    Response result = await dio.post(url, data: jsonEncode(data));

    return result;
  }

  Future<UserModel?> userLogin(Map<String, dynamic> data) async {
    var url = "$baseUrl/UserLogin";

    Response result = await dio.post(url, data: jsonEncode(data));

    if (result.data['Message'] != 'Login Failed') {
      final UserModel model = UserModel.fromJson(jsonEncode(result.data));
      return model;
    } else {
      return null;
    }
  }

  Future<List<EventModel>> getAgenda(int eventId) async {
    var url = "$baseUrl/LoadAgenda?EventId=1";

    Response result = await dio.post(url);

    List<EventModel> eventsList = result.data['Data']['Result']!
        .map<EventModel>((req) => EventModel.fromJson(jsonEncode(req)))
        .toList();

    return eventsList;
  }

  Future<List<SpeakerModel>> getSpeakers(int eventId) async {
    var url = "$baseUrl/LoadSpeakers?EventId=1";

    Response result = await dio.post(url);

    List<SpeakerModel> speakersList = result.data['Data']['Result']!
        .map<SpeakerModel>((req) => SpeakerModel.fromJson(jsonEncode(req)))
        .toList();

    return speakersList;
  }

  Future<dynamic> askQuestion(Map<String, dynamic> data) async {
    var url = askQuestionUrl;

    Response result = await dio.post(url, data: jsonEncode(data));

    return result.data;
  }

  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
}
