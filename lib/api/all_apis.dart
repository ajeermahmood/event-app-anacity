import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:event_app_anacity/model/client.dart';
import 'package:event_app_anacity/model/event_model.dart';
import 'package:event_app_anacity/model/speaker_model.dart';
import 'package:event_app_anacity/model/user_model.dart';

class ApiClass {
  static const baseUrlMobile =
      'https://ldb-me.ve-live.com/api/AdminApiProvider/';

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
  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////

  Future<List<EventModel>> readQrCode(String uid, String userId) async {
    var url = "${baseUrlMobile}qr_code_read.php";

    Response result = await dio.post(url,
        data: jsonEncode(<String, String>{'uid': uid, 'userId': userId}));

    List<EventModel> eventsList = result.data['Data']['Result']!
        .map<EventModel>((req) => EventModel.fromJson(jsonEncode(req)))
        .toList();

    return eventsList;
  }

  Future<bool> removeQrCodeReading(String uid) async {
    var url = "${baseUrlMobile}remove_qr_code_read.php";

    Response result = await dio.post(url, data: uid);
    return result.data;
  }

  Future<dynamic> getAllClients(
      int limit, int pageNumber, String filter) async {
    var url = "${baseUrlMobile}get_all_registered_clients.php";

    Response result = await dio.post(url,
        data: jsonEncode(<String, dynamic>{
          'limit': limit,
          'pageNumber': pageNumber,
          'filter': filter
        }));

    List<ClientModel> clientsList = result.data['clients']!
        .map<ClientModel>((req) => ClientModel.fromJson(jsonEncode(req)))
        .toList();

    return {
      "clients": clientsList,
      "count": result.data['count'],
      "total_count": result.data['total_count'],
      "total_count_reg": result.data['total_count_reg'],
      "total_count_unreg": result.data['total_count_unreg'],
    };
  }

  Future<UserModel?> login(String username, String password) async {
    var url = "${baseUrlMobile}login_for_event.php";

    Response result = await dio.post(url,
        data: jsonEncode(
            <String, String>{'username': username, 'password': password}));

    if (result.data != 'invalid-user') {
      final UserModel model = UserModel.fromJson(jsonEncode(result.data));
      return model;
    } else {
      return null;
    }
  }

  Future<UserModel> getUser(String uid) async {
    var url = "${baseUrlMobile}get_agent_details.php";

    Response result = await dio.post(url, data: uid);

    final UserModel model = UserModel.fromJson(jsonEncode(result.data));
    return model;
  }

  Future<List<UserModel>> getAllAgents() async {
    var url = "${baseUrlMobile}get_all_agents.php";

    Response result = await dio.get(url);

    List<UserModel> agentsList = result.data
        .map<UserModel>((req) => UserModel.fromJson(jsonEncode(req)))
        .toList();
    return agentsList;
  }

  Future<dynamic> getAllReadings(
      int limit, int pageNumber, String userId) async {
    var url = "${baseUrlMobile}get_all_readings_of_agent.php";

    Response result = await dio.post(url,
        data: jsonEncode(<String, dynamic>{
          'limit': limit,
          'pageNumber': pageNumber,
          'userId': userId
        }));

    List<ClientModel> readingsList = result.data['readings']
        .map<ClientModel>((req) => ClientModel.fromJson(jsonEncode(req)))
        .toList();
    return {
      "readings": readingsList,
      "count": result.data['count'],
    };
  }
}
