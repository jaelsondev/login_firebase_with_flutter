import 'package:get/route_manager.dart';
import 'package:login_firebase_with_flutter/app/bindings/home_binding.dart';
import 'package:login_firebase_with_flutter/app/bindings/login_binding.dart';
import 'package:login_firebase_with_flutter/app/routes/app_routes.dart';
import 'package:login_firebase_with_flutter/app/ui/android/home_page.dart';
import 'package:login_firebase_with_flutter/app/ui/android/initial_page.dart';
import 'package:login_firebase_with_flutter/app/ui/android/login_page.dart';
import 'package:login_firebase_with_flutter/app/ui/android/register_page.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => InitialPage()),
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: Routes.REGISTER, page: () => RegisterPage()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
  ];
}