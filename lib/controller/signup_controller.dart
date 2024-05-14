import 'package:event_app_anacity/api/all_apis.dart';
import 'package:event_app_anacity/shared/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  SignUpController();

  ApiClass apiClass = ApiClass();
  SharedPrefs sharedPrefs = SharedPrefs();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController instaIDController = TextEditingController();
  TextEditingController titokIDController = TextEditingController();

  RxBool isUserNotInsertData = RxBool(false);

  RxBool loggingInLoading = RxBool(false);

  RxBool isPasswordDisplay = RxBool(false);

  List<String> specailityList = <String>['One', 'Two', 'Three', 'Four'];

  RxString specialityValue = 'One'.obs;

  List<String> countryList = <String>[
    'United Arab Emirates',
    'India',
    'Japan',
    'Chine'
  ];

  RxString countryValue = 'United Arab Emirates'.obs;

  RxBool termsBool = RxBool(false);

  RxBool isRegisterOk() {
    if (nameController.text != '' &&
        emailController.text != '' &&
        passwordController.text != '' &&
        mobileNoController.text != '' &&
        instaIDController.text != '' &&
        titokIDController.text != '' &&
        termsBool.value) {
      return true.obs;
    } else {
      return false.obs;
    }
  }
}
