import 'package:get/get.dart';

class MyDemandBoardLogic extends GetxController {

}

class MyDemandBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyDemandBoardLogic());
  }
}