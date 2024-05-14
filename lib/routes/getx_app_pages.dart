import 'package:event_app_anacity/page/signup_page.dart';
import 'package:get/get.dart';
import 'package:event_app_anacity/bindings/base_bindings.dart';
import 'package:event_app_anacity/page/login_page.dart';
import 'package:event_app_anacity/page/reg_details.dart';
import 'package:event_app_anacity/page/splash_screen.dart';
import 'package:event_app_anacity/routes/app_routes.dart';
import 'package:event_app_anacity/widgets/bottom_nav.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignUpPage(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.base,
      page: () => const BottomNavbarWidget(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.regDetails,
      page: () => const RegDetailsPage(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
  ];
}
