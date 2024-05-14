import 'package:get/get.dart';
import 'package:event_app_anacity/model/user.dart';
import 'package:event_app_anacity/routes/app_routes.dart';
import 'package:event_app_anacity/shared/shared_prefs.dart';

class BottomNavbarController extends GetxController {
  BottomNavbarController();

  RxInt currentIndex = 0.obs;

  Rxn<UserModel> userModel = Rxn<UserModel>();

  SharedPrefs sharedPrefs = SharedPrefs();

  RxBool isLogouting = false.obs;

  logout() async {
    Future.delayed(const Duration(seconds: 1), () async {
      await sharedPrefs.removeUserID();
      isLogouting(false);
      Get.offAllNamed(AppRoutes.login);
    });
  }
}
