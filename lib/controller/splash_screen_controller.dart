import 'package:event_app_anacity/api/all_apis.dart';
import 'package:event_app_anacity/controller/home_page_controller.dart';
import 'package:event_app_anacity/routes/app_routes.dart';
import 'package:event_app_anacity/shared/shared_prefs.dart';
import 'package:get/get.dart';

class SplashScreenViewController extends GetxController {
  SharedPrefs sharedPrefs = SharedPrefs();

  ApiClass apiClass = ApiClass();

  @override
  void onInit() async {
    super.onInit();

    String? email = await sharedPrefs.getUserEmail();
    String? password = await sharedPrefs.getUserPassword();

    if (email != null && password != null) {
      final HomePageController homePageController =
          Get.put(HomePageController(), permanent: true);

      Map<String, dynamic> data = {
        "Email": email,
        "Password": password,
      };

      await apiClass
          .userLogin(data)
          .then((userModel) async => {
                homePageController.userModel(userModel),
              })
          .then((value) => Get.offAllNamed(AppRoutes.homePage));
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
