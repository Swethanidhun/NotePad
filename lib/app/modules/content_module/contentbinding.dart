import 'package:get/get.dart';
import 'package:todoapp/app/modules/content_module/contentcontroller.dart';

class ContentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContentController>(() => ContentController());
  }
}
