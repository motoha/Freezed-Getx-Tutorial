import 'package:get/get.dart';

import '../modules/Post/bindings/post_binding.dart';
import '../modules/Post/views/post_view.dart';
import '../modules/dynamicTab/bindings/dynamic_tab_binding.dart';
import '../modules/dynamicTab/views/dynamic_tab_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.POST,
      page: () => const PostView(),
      binding: PostBinding(),
    ),
    GetPage(
      name: _Paths.DYNAMIC_TAB,
      page: () => DynamicTab(),
      binding: DynamicTabBinding(),
    ),
  ];
}
