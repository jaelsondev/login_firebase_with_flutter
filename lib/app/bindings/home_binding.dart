import 'package:get/get.dart';
import 'package:login_firebase_with_flutter/app/controller/home_controller.dart';

class HomeBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut< HomeController>(() => HomeController());
  }
}