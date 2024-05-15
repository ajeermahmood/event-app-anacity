import 'package:event_app_anacity/api/all_apis.dart';
import 'package:event_app_anacity/controller/home_page_controller.dart';
import 'package:event_app_anacity/shared/shared_prefs.dart';
import 'package:get/get.dart';

class BadgePageController extends GetxController {
  SharedPrefs sharedPrefs = SharedPrefs();

  ApiClass apiClass = ApiClass();

  RxString qrCodeImg = "".obs;

  HomePageController homePageController = Get.put(HomePageController());

  @override
  void onInit() async {
    super.onInit();

    var firstPart = homePageController.userModel.value!.qrCode.split('/');

    qrCodeImg('https://ldb-me.ve-live.com/QRUploader/${firstPart[5]}');
  }
}
