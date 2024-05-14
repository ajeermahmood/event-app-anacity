import 'package:event_app_anacity/controller/agenda_page_controller.dart';
import 'package:event_app_anacity/controller/badge_page_controller.dart';
import 'package:event_app_anacity/widgets/app_bar_widget.dart';
import 'package:event_app_anacity/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BadgePage extends GetView<BadgePageController> {
  const BadgePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    Get.put(AgendaPageController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: getAppBar(_scaffoldKey),
        drawer: DrawerWidget(),
        body: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/riyadh-loreal.png',
                fit: BoxFit.cover,
              ),
            ),
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
    );
  }
}
