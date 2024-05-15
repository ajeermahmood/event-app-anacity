import 'package:event_app_anacity/api/all_apis.dart';
import 'package:event_app_anacity/model/user_model.dart';
import 'package:event_app_anacity/routes/app_routes.dart';
import 'package:event_app_anacity/shared/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  SharedPrefs sharedPrefs = SharedPrefs();

  ApiClass apiClass = ApiClass();

  Rxn<UserModel> userModel = Rxn<UserModel>();

  RxBool isLogouting = false.obs;

  Future<void> logout() async {
    Get.defaultDialog(
        title: "LOG OUT",
        titleStyle: const TextStyle(fontWeight: FontWeight.bold),
        middleText: "Are you sure you want to logout?",
        middleTextStyle: TextStyle(fontSize: 16, color: Colors.grey[600]),
        contentPadding: const EdgeInsets.all(20),
        titlePadding: const EdgeInsets.only(top: 20),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.red[300]),
            ),
            onPressed: () async {
              isLogouting(true);
              await sharedPrefs.removeUserEmail();
              await sharedPrefs.removeUserPassword();
              Get.offAllNamed(AppRoutes.login);
              Get.delete<HomePageController>(force: true);
              Get.back();
              isLogouting(false);
            },
            child: Obx(() => isLogouting.value
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'LOG OUT',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.grey[350]),
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'CANCEL',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ]);
  }

  List<Map<String, dynamic>> slidePaneList = [
    {
      "image": "assets/images/agenda.png",
      "path": AppRoutes.agendaPage,
    },
    {
      "image": "assets/images/speakers.png",
      "path": AppRoutes.allSpeakers,
    },
    {
      "image": "assets/images/badge.png",
      "path": AppRoutes.badgePage,
    },
    {
      "image": "assets/images/venue.png",
      "path": "",
    },
    {
      "image": "assets/images/images.png",
      "path": "",
    },
    {
      "image": "assets/images/videos.png",
      "path": "",
    },
    {
      "image": "assets/images/questions.png",
      "path": AppRoutes.askQuestionPage,
    },
    {
      "image": "assets/images/voting.png",
      "path": "",
    },
    {
      "image": "assets/images/social.png",
      "path": "",
    },
    {
      "image": "assets/images/survey.png",
      "path": "",
    },
    {
      "image": "assets/images/cme.png",
      "path": "",
    },
    {
      "image": "assets/images/more.png",
      "path": "",
    },
  ];
}
