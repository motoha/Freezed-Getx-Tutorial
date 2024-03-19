import 'package:get/get.dart';

import '../controllers/dynamic_tab_controller.dart';

class DynamicTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DynamicTabController>(
      () => DynamicTabController(),
    );
  }
}
