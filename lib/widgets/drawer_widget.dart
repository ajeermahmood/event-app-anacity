import 'package:event_app_anacity/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  DrawerWidget({
    super.key,
  });

  List<Map<String, dynamic>> drawerList = [
    {
      "icon": Icons.home,
      "title": 'Home',
      "path": AppRoutes.homePage,
    },
    {
      "icon": Icons.calendar_month,
      "title": 'Agenda',
      "path": AppRoutes.agendaPage,
    },
    {
      "icon": Icons.person,
      "title": 'Speaker',
      "path": "",
    },
    {
      "icon": Icons.qr_code,
      "title": 'Badge',
      "path": AppRoutes.badgePage,
    },
    {
      "icon": Icons.map,
      "title": 'Venue',
      "path": "",
    },
    {
      "icon": Icons.image,
      "title": 'Brand Innovation',
      "path": "",
    },
    {
      "icon": Icons.video_camera_back_outlined,
      "title": 'Brand videos',
      "path": "",
    },
    {
      "icon": Icons.question_mark,
      "title": 'Ask Questions',
      "path": "",
    },
    {
      "icon": Icons.bar_chart,
      "title": 'Voting',
      "path": "",
    },
    {
      "icon": Icons.send,
      "title": 'Social Media',
      "path": "",
    },
    {
      "icon": Icons.list,
      "title": 'Survey',
      "path": "",
    },
    {
      "icon": Icons.school,
      "title": 'CME',
      "path": "",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: drawerList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              if (drawerList[index]["path"] != "") {
                Get.toNamed(drawerList[index]["path"]);
              }
            },
            child: ListTile(
              leading: Icon(drawerList[index]["icon"]),
              title: Text(drawerList[index]["title"]),
            ),
          ),
        ),
      ),
    );
  }
}
