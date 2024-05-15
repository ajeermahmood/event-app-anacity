import 'package:email_validator/email_validator.dart';
import 'package:event_app_anacity/controller/signup_controller.dart';
import 'package:event_app_anacity/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(null),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[350],
            height: 1.0,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Obx(
              () => Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.isFullNameValid(false);
                          });
                          return "Enter Full Name *";
                        } else {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.isFullNameValid(true);
                          });
                          return null;
                        }
                      },
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Full Name',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      validator: (value) {
                        if (EmailValidator.validate(value!)) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.isEmailValid(true);
                          });
                          return null;
                        } else {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.isEmailValid(false);
                          });
                          return "Enter a valid email";
                        }
                      },
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.isPasswordValid(false);
                          });
                          return 'Enter a password *';
                        } else {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.isPasswordValid(true);
                          });
                          return null;
                        }
                      },
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Password',
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
                      obscureText:
                          controller.isPasswordDisplay.value ? false : true,
                    ),
                    const SizedBox(height: 30),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Select Speciality *',
                      ),
                      isExpanded: true,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                      value: controller.specialityValue.value,
                      onChanged: (String? value) {
                        controller.specialityValue.value = value!;
                      },
                      items: controller.specailityList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Select Country *',
                      ),
                      isExpanded: true,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                      value: controller.countryValue.value,
                      onChanged: (String? value) {
                        controller.countryValue.value = value!;
                      },
                      items: controller.countryList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.isMobileNoValid(false);
                          });
                          return 'Enter Mobile Number *';
                        } else {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.isMobileNoValid(true);
                          });
                          return null;
                        }
                      },
                      controller: controller.mobileNoController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Mobile Number',
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.isInstaIDValid(false);
                          });
                          return 'Instagram @';
                        } else {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.isInstaIDValid(true);
                          });
                          return null;
                        }
                      },
                      controller: controller.instaIDController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Instagram @',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.isTitokIDValid(false);
                          });
                          return 'TikTok @';
                        } else {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.isTitokIDValid(true);
                          });
                          return null;
                        }
                      },
                      controller: controller.titokIDController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'TikTok @',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: controller.termsBool.value,
                          onChanged: (value) {
                            controller.termsBool.value = value!;
                          },
                        ),
                        const Flexible(
                          child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () async {
                          controller.isRegisterOk().value
                              ? await controller.signUp()
                              : null;
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            controller.isRegisterOk().value
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
                                'Register',
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
                    Center(
                      child: InkWell(
                        onTap: () {
                          controller.clearTextFields();
                          Get.toNamed(AppRoutes.login);
                        },
                        child: Text(
                          'Or Login to an Account',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[600],
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
