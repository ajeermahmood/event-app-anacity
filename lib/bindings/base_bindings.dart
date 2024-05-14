import 'package:event_app_anacity/controller/signup_controller.dart';
import 'package:get/get.dart';
import 'package:event_app_anacity/controller/all_readings_controller.dart';
import 'package:event_app_anacity/controller/all_reg_controller.dart';
import 'package:event_app_anacity/controller/event_controller.dart';
import 'package:event_app_anacity/controller/login_controller.dart';
import 'package:event_app_anacity/controller/qr_code_reader_controller.dart';
import 'package:event_app_anacity/controller/splash_screen_controller.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenViewController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SignUpController());
    // Get.lazyPut(() => BottomNavbarController());
    Get.lazyPut(() => QrCodeReaderController());
    Get.lazyPut(() => AllReadingsController());
    Get.lazyPut(() => AllRegController());
    Get.lazyPut(() => EventController());
  }
}
