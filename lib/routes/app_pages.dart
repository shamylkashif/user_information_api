import 'package:userinformationapi/utils/app_imports.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.login,
        page: () => LoginScreen(),
        binding: UserBindings(),
    ),
    GetPage(
        name: AppRoutes.dashboard,
        page: () => Dashboard(),
    ),
    GetPage(
        name: AppRoutes.detail,
        page: () => DetailScreen(),
    ),
  ];
}