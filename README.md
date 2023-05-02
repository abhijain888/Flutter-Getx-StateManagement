# Flutter Getx State Management

Get has two different state managers: the simple state manager (we'll call it GetBuilder) and the reactive state manager (GetX/Obx)

### Let's get into code:

1. Installation:
```
flutter pub add get
```

2. Import the package:
```
import 'package:get/get.dart';
```
3. Dependency management
Get has a simple and powerful dependency manager that allows you to retrieve the same class as your Bloc or Controller with just 1 lines of code, no Provider context, no inheritedWidget:
```
Controller controller = Get.put(Controller()); // Rather Controller controller = Controller();
```

4. Add this code in controller class:
```
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
```

## Developers
MIT License

Copyright (c) 2019 TecOrb Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
