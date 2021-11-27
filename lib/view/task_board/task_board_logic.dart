import 'package:get/get.dart';

class TaskBoardLogic extends GetxController {

}

class TaskBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskBoardLogic());
  }
}