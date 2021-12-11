import 'dart:async';
import 'dart:ui';

import 'package:admin/view/login/login_view.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginController extends GetxController {
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  RxString loginAccount = "".obs;
  RxString loginPassword = "".obs;
  RxString registerAccount = "".obs;
  RxString registerPwd = "".obs;
  RxString registerConfirmPwd = "".obs;
  RxBool isFront = true.obs;
  Color registerColor1 = Color(0xFF212332);
  Color registerColor2 = Color(0xFF2A2D3E);

  void changeCard() {
    this.isFront.value = true;
    LoginState().animate();
  }

  void handleLogin() async {
    Timer(Duration(seconds: 3), () {
      btnController.success();
      // TODO: 界面跳转
      // Get.to(MainScreen());
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }

}