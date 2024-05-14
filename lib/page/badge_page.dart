import 'package:event_app_anacity/controller/agenda_page_controller.dart';
import 'package:event_app_anacity/controller/badge_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BadgePage extends GetView<BadgePageController> {
  const BadgePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AgendaPageController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () async {
                // await controller.logout();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.blue[300],
              ),
            )
          ],
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue[300],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.grey[350],
              height: 1.0,
            ),
          ),
        ),
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
                    SizedBox(height: 20),
                    Text('SCAN THIS QR CODE FOR ATTENDANCE'),
                    SizedBox(height: 10),
                    Text('ABDUL MUHEETH'),
                    SizedBox(height: 20),
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
