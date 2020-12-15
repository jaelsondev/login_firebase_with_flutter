import 'package:get/get.dart';
import 'package:login_firebase_with_flutter/app/controller/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
