import 'package:flutter_getx_state_management/network_api.dart';
import 'package:flutter_getx_state_management/user_model.dart';
import 'package:get/get.dart';

class UsersListController extends GetxController {
  bool isLoading = true;
  List<UserModel> usersList = [];

  @override
  void onInit() {
    getUsersList();
    super.onInit();
  }

  void getUsersList() async {
    isLoading = true;
    update();
    usersList = await _fetchUsersList();
    isLoading = false;
    update();
  }

  Future<List<UserModel>> _fetchUsersList() async {
    List response = await NetworkApi.getResponse(
      url: "https://jsonplaceholder.typicode.com/users",
    );
    return response.map((e) => UserModel.fromJson(e)).toList();
  }
}
