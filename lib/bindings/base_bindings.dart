import 'package:event_app_anacity/controller/agenda_page_controller.dart';
import 'package:event_app_anacity/controller/ask_q_controller.dart';
import 'package:event_app_anacity/controller/badge_page_controller.dart';
import 'package:event_app_anacity/controller/login_controller.dart';
import 'package:event_app_anacity/controller/signup_controller.dart';
import 'package:event_app_anacity/controller/speakers_controller.dart';
import 'package:event_app_anacity/controller/splash_screen_controller.dart';
import 'package:get/get.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenViewController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SignUpController());
    // Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => AgendaPageController());
    Get.lazyPut(() => BadgePageController());
    Get.lazyPut(() => AskQuestionPageController());
    Get.lazyPut(() => SpeakersController());
  }
}
