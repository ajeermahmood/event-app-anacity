import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:event_app_anacity/bindings/base_bindings.dart';
import 'package:event_app_anacity/routes/app_routes.dart';
import 'package:event_app_anacity/routes/getx_app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event App Anacity',
      initialBinding: BaseBindings(),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splashScreen,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
