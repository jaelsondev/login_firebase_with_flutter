import 'package:flutter/material.dart';
import 'package:login_firebase_with_flutter/app/routes/app_routes.dart';
import 'package:splashscreen/splashscreen.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SplashScreen(
            seconds: 3,
            gradientBackground: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.cyan[100],
                  Colors.cyan[200],
                ]),
            navigateAfterSeconds: Routes.LOGIN,
            loaderColor: Colors.transparent,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/logo.png'), fit: BoxFit.contain)),
            ),
          )
        ],
      ),
    );
  }
}
