import 'package:userinformationapi/utils/app_imports.dart';

class UserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}