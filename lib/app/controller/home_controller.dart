import 'package:get/get.dart';
import 'package:login_firebase_with_flutter/app/data/model/user_model.dart';

class HomeController extends GetxController {
  final UserModel user = Get.arguments;
}