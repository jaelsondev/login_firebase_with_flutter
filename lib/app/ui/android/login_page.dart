import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase_with_flutter/app/controller/login_controller.dart';
import 'package:login_firebase_with_flutter/app/routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              Hero(
                  tag: 'hero',
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 48,
                    child: Image.asset('assets/logo.png'),
                  )),
              SizedBox(height: 48),
              TextFormField(
                controller: _loginController.emailTextController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo obrigatório';
                  } else if (!GetUtils.isEmail(value)) {
                    return 'O campo de e-mail é obrigatório';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "Email",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _loginController.passwordTextController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo obrigatório';
                  } else if (value.length < 6) {
                    return 'A senha deve conter pelo menos 6 caracteres';
                  }
                  return null;
                },
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Senha",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    )),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _loginController.login();
                    }
                  },
                  padding: EdgeInsets.all(12),
                  color: Get.theme.primaryColor,
                  child: Text('Acessar', style: TextStyle(color: Colors.white)),
                ),
              ),
              FlatButton(
                  onPressed: () {},
                  child: Text('Esqueceu a sua senha?',
                      style: TextStyle(color: Colors.black54))),
              FlatButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Text('Cadastra-se',
                      style: TextStyle(color: Colors.black54)))
            ],
          ),
        ),
      ),
    );
  }
}
