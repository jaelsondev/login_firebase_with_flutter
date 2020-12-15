import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_firebase_with_flutter/app/routes/app_pages.dart';
import 'package:login_firebase_with_flutter/app/routes/app_routes.dart';
import 'package:login_firebase_with_flutter/app/ui/theme/app_theme.dart';

void main() async{
  await GetStorage.init('login_firebase');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            title: 'Login Firebase',
            debugShowCheckedModeBanner: false,
            getPages: AppPages.routes,
            initialRoute: Routes.INITIAL,
            theme: appThemeData,
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}
