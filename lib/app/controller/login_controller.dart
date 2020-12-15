import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_firebase_with_flutter/app/data/model/user_model.dart';
import 'package:login_firebase_with_flutter/app/data/repository/login_repository.dart';
import 'package:login_firebase_with_flutter/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final LoginRepository repository = LoginRepository();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  GetStorage box = GetStorage('login_firebase');

  @override
  void onReady() {
    isLogged();
    super.onReady();
  }

  void isLogged() {
    if(box.hasData('auth')) {
      UserModel user = UserModel(
        id: box.read('auth')['id'],
        name: box.read('auth')['name'],
        email: box.read('auth')['email'],
        urlimage: box.read('auth')['urlimage'],
      );

      Get.offAllNamed(Routes.HOME, arguments: user);
    }
  }

  void register() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    UserModel user = await repository.createUserWithEmailAndPassword(
        emailTextController.text,
        passwordTextController.text,
        nameTextController.text);

    if (user != null) {
      box.write('auth', user);
      Get.offAllNamed(Routes.HOME, arguments: user);
    }
  }

  void login() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    UserModel user = await repository.signInWithEmailAndPassword(
        emailTextController.text, passwordTextController.text);

    if (user != null) {
      box.write('auth', user);
      Get.offAllNamed(Routes.HOME, arguments: user);
    }
  }

  void logout() {
    repository.signout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
