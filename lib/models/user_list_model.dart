import 'package:riverpod_api_app/models/base_model.dart';

class UserListItemModel extends IBaseModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserListItemModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };

  @override
  fromJson(Map<String, dynamic> json) {
    return UserListItemModel(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"],
    );
  }
}
