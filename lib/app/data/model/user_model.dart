import 'package:firebase_auth/firebase_auth.dart';

class UserModel {

  String id;
  String name;
  String email;
  String urlimage;

  UserModel({ this.id, this.name, this.email, this.urlimage });

  UserModel.fromSnapshot(User user) :
    id = user.uid,
    name = user.displayName,
    email = user.email,
    urlimage = user.photoURL;

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "name": name,
      "email": email,
      "urlimage": urlimage,
    };
  }
}