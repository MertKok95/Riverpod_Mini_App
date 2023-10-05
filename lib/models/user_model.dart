import 'package:riverpod_api_app/models/base_model.dart';

class UserModel implements IBaseModel {
  String? email;
  String? password;
  String? token;

  UserModel({this.email, this.password, this.token});

  @override
  fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json["email"], password: json["password"], token: json["token"]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "token": token,
    };
  }
}
