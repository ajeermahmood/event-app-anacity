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
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/example-qr-code.png',
                        fit: BoxFit.contain,
                      ),
                      // Image.network(
                      //   controller.homePageController.userModel.value!.qrCode,
                      //   fit: BoxFit.contain,
                      // ),
                      const SizedBox(height: 20),
                      const Text('SCAN THIS QR CODE FOR ATTENDANCE'),
                      const SizedBox(height: 10),
                      const Text(
                        '"ABDUL MUHEETH"',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue),
                      ),
                      const SizedBox(height: 20),
                    ],
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
