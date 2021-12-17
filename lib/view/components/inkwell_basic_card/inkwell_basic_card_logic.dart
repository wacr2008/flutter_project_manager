import 'package:get/get.dart';

class BasicCardLogic extends GetxController {
  RxDouble elevation = 1.0.obs;
  RxBool isMoveIn = false.obs;

  void cursorMoveIn(){
    // elevation.value = 5.0;
    isMoveIn.value = true;
  }
  void cursorMoveOut(){
    // elevation.value = 1.0;
    isMoveIn.value = false;
  }
}
class BasicCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BasicCardLogic());
  }
}