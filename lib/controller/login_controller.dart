import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:event_app_anacity/api/all_apis.dart';
import 'package:event_app_anacity/controller/bottom_nav_controller.dart';
import 'package:event_app_anacity/routes/app_routes.dart';
import 'package:event_app_anacity/shared/shared_prefs.dart';

class LoginController extends GetxController {
  LoginController();

  ApiClass apiClass = ApiClass();
  SharedPrefs sharedPrefs = SharedPrefs();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isUserDataIncorrect = RxBool(false);
  RxBool isUserNotInsertData = RxBool(false);

  RxBool loggingInLoading = RxBool(false);

  RxBool isPasswordDisplay = RxBool(false);

  clearTextFields() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> login() async {
    loggingInLoading(true);

    Map<String, dynamic> data = {
      "Email": emailController.text,
      "Password": passwordController.text,
    };

    if (emailController.text != '' && passwordController.text != '') {
      await apiClass.userLogin(data).then((userModel) async => {
            // print(userModel!.doctorName),
            if (userModel != null)
              {
                await sharedPrefs.setUserID(userModel.useruniqueid),
                emailController.text = '',
                passwordController.text = '',
                Get.offAllNamed(AppRoutes.homePage),
                isUserDataIncorrect(false),
                loggingInLoading(false)
              }
            else
              {
                isUserDataIncorrect(true),
                loggingInLoading(false),
              }
          });

      if (isUserDataIncorrect.value == true) {
        Future.delayed(const Duration(seconds: 2), () {
          isUserDataIncorrect(false);
        });
      }
    } else {
      isUserNotInsertData(true);
      loggingInLoading(false);
      Future.delayed(const Duration(seconds: 2), () {
        isUserNotInsertData(false);
      });
    }
  }
}
