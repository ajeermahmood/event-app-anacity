import 'package:event_app_anacity/api/all_apis.dart';
import 'package:event_app_anacity/model/event_model.dart';
import 'package:event_app_anacity/shared/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AskQuestionPageController extends GetxController {
  SharedPrefs sharedPrefs = SharedPrefs();

  ApiClass apiClass = ApiClass();

  RxBool isLoading = RxBool(true);

  RxList<EventModel> eventsList = RxList<EventModel>();

  List<String> allSessions = <String>[];

  RxString selectedSession = RxString('');

  TextEditingController nameController = TextEditingController();
  TextEditingController questionController = TextEditingController();

  RxBool isProcessing = RxBool(false);

  RxBool isQuestionOk() {
    if (nameController.text != '' && questionController.text != '') {
      return true.obs;
    } else {
      return false.obs;
    }
  }

  @override
  void onInit() async {
    super.onInit();

    await apiClass
        .getAgenda(1)
        .then((value) => {
              eventsList(value),
              allSessions = value
                  .map((e) => e.speakerName)
                  .where((name) => name.isNotEmpty) // Filter out empty strings
                  .toSet() // Convert to set to remove duplicates
                  .toList(),
              selectedSession(allSessions.first),
            })
        .then((value) => isLoading(false))
        .then((value) => print(allSessions));
  }

  Future<void> askQuestion() async {
    isProcessing(true);
    Map<String, dynamic> data = {
      "SpeakerName": selectedSession.value,
      "AskedBy": nameController.text,
      "QuestionDetail": questionController.text,
      "EventId": 1
    };
    await apiClass
        .askQuestion(data)
        .then((value) => print(value))
        .then((value) => isProcessing(false));
  }
}
