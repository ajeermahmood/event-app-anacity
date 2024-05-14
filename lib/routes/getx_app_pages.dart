import 'package:event_app_anacity/bindings/base_bindings.dart';
import 'package:event_app_anacity/page/agenda_page.dart';
import 'package:event_app_anacity/page/ask_q_page.dart';
import 'package:event_app_anacity/page/badge_page.dart';
import 'package:event_app_anacity/page/home_page.dart';
import 'package:event_app_anacity/page/login_page.dart';
import 'package:event_app_anacity/page/signup_page.dart';
import 'package:event_app_anacity/page/speaker_details.dart';
import 'package:event_app_anacity/page/speakers_page.dart';
import 'package:event_app_anacity/page/splash_screen.dart';
import 'package:event_app_anacity/routes/app_routes.dart';
import 'package:get/get.dart';

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
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.agendaPage,
      page: () => const AgendaPage(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.badgePage,
      page: () => const BadgePage(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.askQuestionPage,
      page: () => const AskQuestionPage(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.allSpeakers,
      page: () => const AllSpeakersPage(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.speakerDetailsPage,
      page: () => const SpeakerDetailsPage(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
  ];
}
