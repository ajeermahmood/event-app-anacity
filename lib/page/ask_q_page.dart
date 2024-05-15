import 'package:event_app_anacity/controller/ask_q_controller.dart';
import 'package:event_app_anacity/widgets/app_bar_widget.dart';
import 'package:event_app_anacity/widgets/drawer_widget.dart';
import 'package:event_app_anacity/widgets/event_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AskQuestionPage extends GetView<AskQuestionPageController> {
  const AskQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: getAppBar(scaffoldKey),
        drawer: DrawerWidget(),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const EventLogoWidget(pageName: "ASK QUESTION"),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select Session',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  hintText: '',
                                ),
                                isExpanded: true,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                                value: controller.selectedSession.value,
                                onChanged: (String? value) {
                                  controller.selectedSession.value = value!;
                                },
                                items: controller.allSessions
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 30),
                              TextFormField(
                                validator: (value) =>
                                    value!.isEmpty ? 'Enter Your Name' : null,
                                controller: controller.nameController,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: 'Your Name',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                validator: (value) =>
                                    value!.isEmpty ? 'Ask Question' : null,
                                controller: controller.questionController,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: 'Ask Question',
                                ),
                                maxLines: 3,
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await controller.askQuestion();
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      controller.isQuestionOk().value
                                          ? Colors.blue
                                          : Colors.blue[100],
                                    ),
                                  ),
                                  child: controller.isProcessing.value == true
                                      ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : Text(
                                          'Submit',
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
                            ],
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
