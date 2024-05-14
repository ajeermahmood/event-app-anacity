import 'package:event_app_anacity/api/all_apis.dart';
import 'package:event_app_anacity/controller/home_page_controller.dart';
import 'package:event_app_anacity/model/speaker_model.dart';
import 'package:event_app_anacity/routes/app_routes.dart';
import 'package:event_app_anacity/shared/shared_prefs.dart';
import 'package:get/get.dart';

class SpeakersController extends GetxController {
  SharedPrefs sharedPrefs = SharedPrefs();

  ApiClass apiClass = ApiClass();

  RxBool isLoading = RxBool(true);

  HomePageController homePageController = Get.put(HomePageController());

  RxList<SpeakerModel> speakersList = RxList<SpeakerModel>();

  Rxn<SpeakerModel> selectedSpeaker = Rxn<SpeakerModel>();

  @override
  void onInit() async {
    super.onInit();

    await apiClass
        .getSpeakers(1)
        .then((value) => {
              speakersList(value),
            })
        .then((value) => isLoading(false));
  }

  void selectSpeaker(SpeakerModel speaker) {
    selectedSpeaker(speaker);
    Get.toNamed(AppRoutes.speakerDetailsPage);
  }
}
