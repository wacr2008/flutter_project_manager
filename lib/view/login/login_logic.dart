import 'dart:async';
import 'dart:ui';

import 'package:admin/controllers/menu_controller.dart';
import 'package:admin/utils/sharedpreference_util.dart';
import 'package:admin/view/login/login_view.dart';
import 'package:admin/view/main/main_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  int value = 0;
  RxInt identify = 1.obs;


  void changeCard() {
    this.isFront.value = true;
    LoginState().animate();
  }

  void handleLogin() async {
    Timer(Duration(seconds: 1), () {
      btnController.success();
      getUserInfo();
      Get.to(() {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => MenuController(),
            ),
          ],
          child: MainScreen(),
        );
      });
    });
  }

  void getUserInfo(){
    SharedPreferences s = SharedPreferenceUtil.instance;
    s.setString('identity', '产品');
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