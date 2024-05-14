import 'package:event_app_anacity/api/all_apis.dart';
import 'package:event_app_anacity/model/user_model.dart';
import 'package:event_app_anacity/routes/app_routes.dart';
import 'package:event_app_anacity/shared/shared_prefs.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  SharedPrefs sharedPrefs = SharedPrefs();

  ApiClass apiClass = ApiClass();

  Rxn<UserModel> userModel = Rxn<UserModel>();

  Future<void> logout() async {
    await sharedPrefs.removeUserEmail();
    await sharedPrefs.removeUserPassword();
    Get.offAllNamed(AppRoutes.login);

    Get.delete<HomePageController>(force: true);
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
