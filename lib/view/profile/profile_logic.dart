import 'package:get/get.dart';

class ProfileController extends GetxController {

}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }

}