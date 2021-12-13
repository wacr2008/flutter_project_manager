import 'package:get/get.dart';

class LogController extends GetxController {

}

class LogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogController>(() => LogController());
  }

}