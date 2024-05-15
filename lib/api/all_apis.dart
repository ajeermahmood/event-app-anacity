import 'dart:convert';

import 'package:event_app_anacity/model/event_model.dart';
import 'package:event_app_anacity/model/speaker_model.dart';
import 'package:event_app_anacity/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiClass {
  var client = http.Client();
  static const baseUrl = 'https://ldb-me.ve-live.com/api/AdminApiProvider';

  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////

  Future<dynamic> registerUser(Map<String, dynamic> data) async {
    var url = Uri.parse("$baseUrl/RegisterUser");

    dynamic result = await client.post(url, body: data);

    return jsonDecode(result.body);
  }

  Future<UserModel?> userLogin(Map<String, dynamic> data) async {
    var url = Uri.parse("$baseUrl/UserLogin");

    dynamic result = await client.post(url, body: data);

    var body = jsonDecode(result.body);

    if (body['Message'] != 'Login Failed') {
      final UserModel model = UserModel.fromJson(jsonEncode(body));
      return model;
    } else {
      return null;
    }
  }

  Future<List<EventModel>> getAgenda(int eventId) async {
    var url = Uri.parse("$baseUrl/LoadAgenda?EventId=1");

    dynamic result = await client.post(url);

    var body = jsonDecode(result.body);

    List<EventModel> eventsList = body['Data']['Result']!
        .map<EventModel>((req) => EventModel.fromJson(jsonEncode(req)))
        .toList();

    return eventsList;
  }

  Future<List<SpeakerModel>> getSpeakers(int eventId) async {
    var url = Uri.parse("$baseUrl/LoadSpeakers?EventId=1");

    dynamic result = await client.post(url);

    var body = jsonDecode(result.body);

    List<SpeakerModel> speakersList = body['Data']['Result']!
        .map<SpeakerModel>((req) => SpeakerModel.fromJson(jsonEncode(req)))
        .toList();

    return speakersList;
  }

  Future<dynamic> askQuestion(Map<String, dynamic> data) async {
    var url = Uri.parse("$baseUrl/AskQuestion");

    dynamic result = await client.post(url, body: data);

    return jsonDecode(result.body);
  }

  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
}
