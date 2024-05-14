import 'package:event_app_anacity/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:event_app_anacity/controller/login_controller.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/lldd.png',
                        width: MediaQuery.of(context).size.width / 1.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          'LOG IN',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height / 2),
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  child: Obx(
                    () => Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: <Widget>[
                          getErrorMessage(controller),
                          TextFormField(
                            validator: (value) =>
                                EmailValidator.validate(value!)
                                    ? null
                                    : "Enter a valid email",
                            controller: controller.emailController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Email',
                            ),
                          ),
                          const SizedBox(height: 40),
                          TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? 'Enter a password' : null,
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.isPasswordDisplay.value =
                                      !controller.isPasswordDisplay.value;
                                },
                                child: controller.isPasswordDisplay.value
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              ),
                            ),
                            obscureText: controller.isPasswordDisplay.value
                                ? false
                                : true,
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () async {
                                await controller.login();
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  controller.emailController.text != '' &&
                                          controller.passwordController.text !=
                                              ''
                                      ? Colors.blue
                                      : Colors.blue[100],
                                ),
                              ),
                              child: controller.loggingInLoading.value == true
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      'Login',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                    ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          Text(
                            'Forget Password?',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600],
                                ),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.signup);
                            },
                            child: Text(
                              'Or Create an Account',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[600],
                                  ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 20.0),
                          //   child: InkWell(
                          //       onTap: () {},
                          //       child: const Text('Forgot Password?')),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget getErrorMessage(LoginController controller) {
  if (controller.isUserDataIncorrect.value == true) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Text(
        'User does not exist',
        style: TextStyle(color: Colors.red),
      ),
    );
  } else if (controller.isUserNotInsertData.value == true) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Text(
        'Please enter data.',
        style: TextStyle(color: Colors.red),
      ),
    );
  } else {
    return const SizedBox(
      height: 36,
    );
  }
}
