import 'dart:convert';

import 'package:event_app_anacity/api/all_apis.dart';
import 'package:event_app_anacity/routes/app_routes.dart';
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

  clearTextFields() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    mobileNoController.clear();
    instaIDController.clear();
    titokIDController.clear();
  }

  Future<void> signUp() async {
    loggingInLoading(true);
    Map<String, dynamic> data = {
      "UserName": nameController.text,
      "Email": emailController.text,
      "Mobile": int.parse(mobileNoController.text),
      "Password": passwordController.text,
      "Speciality": specialityValue.value,
      "Country": countryValue.value,
      "InstagramLink": instaIDController.text,
      "TikTokLink": titokIDController.text,
      "Userconsent": termsBool.value ? 1 : 0, //termsBool.value ? 1 : 0
    };

    // print(data);

    await apiClass.registerUser(data).then((value) => {
          if (jsonDecode(value.toString())['Message'] == 'Failed')
            {
              Get.snackbar("Register Failed", 'Something went wrong'),
              loggingInLoading(false),
            }
          else
            {
              Get.snackbar("Success", 'Registered Successfully'),
              clearTextFields(),
              Get.toNamed(AppRoutes.login),
              loggingInLoading(false),
            }
        });
  }
}
