import 'package:event_app_anacity/controller/home_page_controller.dart';
import 'package:event_app_anacity/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        actions: [
          IconButton(
            onPressed: () async {
              await controller.logout();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: controller.slidePaneList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: index % 3 == 0
                      ? Colors.blue[300]
                      : index == 2 || index == 5 || index == 8 || index == 11
                          ? Colors.blueGrey[500]
                          : Colors.blueGrey[200],
                  child: InkWell(
                    onTap: () {
                      if (controller.slidePaneList[index]["path"] != "") {
                        Get.toNamed(controller.slidePaneList[index]["path"]);
                      }
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            controller.slidePaneList[index]["image"],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
