import 'package:get/get_navigation/get_navigation.dart';
import 'package:todoapp/app/modules/content_module/contentbinding.dart';
import 'package:todoapp/app/modules/content_module/contentpage.dart';
import 'package:todoapp/app/modules/home_module/homebinding.dart';
import 'package:todoapp/app/modules/home_module/homepage.dart';
import 'package:todoapp/app/modules/splash_module/splashpage.dart';
import 'package:todoapp/app/routes/approutes.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: AppRoutes.splashscreen,
      page: () => const SplashPage(),
    ),
    GetPage(
        name: AppRoutes.homescreen,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.contentscreen,
        page: () => const ContentPage(),
        binding: ContentBinding())
  ];
}
