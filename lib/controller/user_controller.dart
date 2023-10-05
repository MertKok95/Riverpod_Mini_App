import 'package:flutter/material.dart';
import 'package:riverpod_api_app/app/cache/cache_manager.dart';
import 'package:riverpod_api_app/app/locator/get_it_locator.dart';
import 'package:riverpod_api_app/models/user_model.dart';
import 'package:riverpod_api_app/services/abstract_regris_service.dart';

import '../models/user_list_model.dart';

class UserController extends ChangeNotifier {
  final _service = locator<IRegrisService>();
  UserModel? user;
  List<UserListItemModel?> users = [];

  Future<bool> signin(UserModel model) async {
    var token = await _service.GetUserData(model);
    if (token.isNotEmpty) {
      model.token = token;
      CacheManager.getInstance.addCacheItem<UserModel>('UserData', model);
      return true;
    }
    return false;
  }

  Future getUserList() async {
    var user = await CacheManager.getInstance
        .getCacheItem<UserModel>("UserData", UserModel());

    if (user != null && user.token != null && user.token!.isNotEmpty) {
      var userList = await _service.GetUserDataList();

      if (userList != null && userList.isNotEmpty) {
        users = userList;
        notifyListeners();
      }
    }
  }

  Future isUser() async {
    var response = await CacheManager.getInstance
        .getCacheItem<UserModel>("UserData", UserModel());
    if (response != null &&
        response.token != null &&
        response.token!.isNotEmpty) {
      user = response;
      notifyListeners();
    }
  }
}
