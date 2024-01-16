import 'package:get/get.dart';

import '../page/home_page.dart';
import '../widget/bottom_navigation_widget.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.bottomNavigation;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: _Paths.bottomNavigation,
      page: () => const BottomNavigationWidget(),
    ),
    
  ];
}