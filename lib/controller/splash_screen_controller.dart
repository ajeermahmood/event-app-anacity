import 'package:event_app_anacity/api/all_apis.dart';
import 'package:event_app_anacity/routes/app_routes.dart';
import 'package:event_app_anacity/shared/shared_prefs.dart';
import 'package:get/get.dart';

class SplashScreenViewController extends GetxController {
  SharedPrefs sharedPrefs = SharedPrefs();

  ApiClass apiClass = ApiClass();

  @override
  void onInit() async {
    super.onInit();

    String? userId = await sharedPrefs.getUserID();

    if (userId != null) {
      Get.offAllNamed(AppRoutes.homePage);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
