import 'package:riverpod_api_app/app/constants/remote_server_constants.dart';
import 'package:riverpod_api_app/models/user_list_model.dart';
import 'package:riverpod_api_app/models/user_model.dart';
import 'package:riverpod_api_app/services/abstract_regris_service.dart';
import 'package:dio/dio.dart';

class RegrisService implements IRegrisService {
  final dio = Dio();

  @override
  Future<String> GetUserData(UserModel model) async {
    try {
      var response = await dio.request(RemoteServerConstants.remoteServerLogin,
          data: {
            'email': model.email,
            'password': model.password,
          },
          options: Options(method: 'POST'));
      if (response.statusCode == 200) {
        return response.data["token"] as String;
      } else {
        return "";
      }
    } catch (e) {
      return "";
    }
  }

  @override
  Future<List<UserListItemModel>?> GetUserDataList() async {
    try {
      var response = await dio.request(
          RemoteServerConstants.remoteServerUserList,
          options: Options(method: 'get'));
      if (response.statusCode == 200) {
        return (response.data['data'] as List)
            .map((e) => UserListItemModel().fromJson(e))
            .toList()
            .cast<UserListItemModel>();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
