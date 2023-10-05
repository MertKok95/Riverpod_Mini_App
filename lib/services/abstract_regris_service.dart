// ignore_for_file: non_constant_identifier_names

import 'package:riverpod_api_app/models/user_list_model.dart';
import 'package:riverpod_api_app/models/user_model.dart';

abstract class IRegrisService {
  Future<String> GetUserData(UserModel model);
  Future<List<UserListItemModel>?> GetUserDataList();
}
