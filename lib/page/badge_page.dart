import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_app_anacity/controller/agenda_page_controller.dart';
import 'package:event_app_anacity/controller/badge_page_controller.dart';
import 'package:event_app_anacity/widgets/app_bar_widget.dart';
import 'package:event_app_anacity/widgets/drawer_widget.dart';
import 'package:event_app_anacity/widgets/event_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BadgePage extends GetView<BadgePageController> {
  const BadgePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    Get.put(AgendaPageController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: getAppBar(scaffoldKey),
        drawer: DrawerWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const EventLogoWidget(pageName: "BADGE"),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Obx(
                  () => Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2.5,
                          child: CachedNetworkImage(
                            imageUrl: controller.qrCodeImg.value,
                            // Some widget to display while the network widget is loading
                            //It could be any widget
                            placeholder: (context, url) => const SizedBox(
                              height: 200.0,
                              width: 200.0,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            // Some widget to display if the network image was unable to load
                            // This could be because of loss of internet connection
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/nope-not-here.webp',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('SCAN THIS QR CODE FOR ATTENDANCE'),
                        const SizedBox(height: 10),
                        Text(
                          '"${controller.homePageController.userModel.value!.doctorName}"'
                              .toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
