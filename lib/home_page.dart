import 'package:flutter/material.dart';
import 'package:flutter_getx_state_management/users_list_controller.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List"),
      ),
      body: GetBuilder<UsersListController>(
        builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async => controller.getUsersList(),
                  child: ListView.builder(
                    itemCount: controller.usersList.length,
                    itemBuilder: (context, index) {
                      var user = controller.usersList[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(user.id.toString()),
                        ),
                        title: Text(user.name ?? ""),
                        subtitle: Text(user.address?.city ?? ""),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
