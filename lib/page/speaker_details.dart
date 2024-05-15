import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_app_anacity/controller/speakers_controller.dart';
import 'package:event_app_anacity/widgets/app_bar_widget.dart';
import 'package:event_app_anacity/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class SpeakerDetailsPage extends GetView<SpeakersController> {
  const SpeakerDetailsPage({super.key});

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
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        child: Image.asset(
                          'assets/images/riyadh-loreal.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4.5,
                                  child: CachedNetworkImage(
                                    imageUrl: controller
                                        .selectedSpeaker.value!.speakerImage,
                                    placeholder: (context, url) =>
                                        const SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  parse(controller.selectedSpeaker.value!
                                          .speakerDesignation)
                                      .body!
                                      .text,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  controller.selectedSpeaker.value!.speakerName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
