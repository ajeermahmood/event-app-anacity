import 'package:event_app_anacity/controller/speakers_controller.dart';
import 'package:event_app_anacity/widgets/app_bar_widget.dart';
import 'package:event_app_anacity/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class AllSpeakersPage extends GetView<SpeakersController> {
  const AllSpeakersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: getAppBar(_scaffoldKey),
        drawer: DrawerWidget(),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/riyadh-loreal.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "SPEAKERS",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.blue[700],
                              ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
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
