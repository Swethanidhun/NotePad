import 'package:get/get.dart';
import 'package:todoapp/app/modules/home_module/homecontroller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
