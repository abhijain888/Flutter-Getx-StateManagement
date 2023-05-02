import 'package:flutter/material.dart';
import 'package:flutter_getx_state_management/users_list_controller.dart';
import 'package:get/get.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
  final controller = Get.put(UsersListController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
