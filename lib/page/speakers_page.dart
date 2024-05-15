import 'package:event_app_anacity/controller/speakers_controller.dart';
import 'package:event_app_anacity/widgets/app_bar_widget.dart';
import 'package:event_app_anacity/widgets/drawer_widget.dart';
import 'package:event_app_anacity/widgets/event_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class AllSpeakersPage extends GetView<SpeakersController> {
  const AllSpeakersPage({super.key});

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
              : Column(
                  children: [
                    const EventLogoWidget(pageName: "SPEAKERS"),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.speakersList.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            controller
                                .selectSpeaker(controller.speakersList[index]);
                          },
                          child: ListTile(
                            leading: CachedNetworkImage(
                              imageUrl:
                                  controller.speakersList[index].speakerImage,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            title: Text(
                              controller.speakersList[index].speakerName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              parse(controller
                                      .speakersList[index].speakerDesignation)
                                  .body!
                                  .text,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios,
                                color: Colors.grey[500]),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
        ),
      ),
    );
  }
}
