import 'package:login_firebase_with_flutter/app/data/model/user_model.dart';
import 'package:login_firebase_with_flutter/app/data/provider/login_provider.dart';

class LoginRepository {
  final LoginApiClient apiClient = LoginApiClient();

  Future<UserModel> createUserWithEmailAndPassword(String email, String password, String name) {
    return apiClient.createUserWithEmailAndPassword(email, password, name);
  }

  Future<UserModel> signInWithEmailAndPassword(String email, String password) {
    return apiClient.signInWithEmailAndPassword(email, password);
  }

  signout() {
    apiClient.signOut();
  }
}
