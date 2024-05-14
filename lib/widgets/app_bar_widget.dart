import 'package:flutter/material.dart';
import 'package:get/get.dart';

dynamic getAppBar(GlobalKey<ScaffoldState> _scaffoldKey) {
  return AppBar(
    backgroundColor: Colors.white,
    actions: [
      IconButton(
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
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
  );
}
