import 'package:userinformationapi/utils/app_imports.dart';

class UserController extends GetxController {
  final ApiService apiService = ApiService();
  var userList = <UserModel>[].obs;
  var isLoading = false.obs;
  var isLoggedIn = false.obs;

  static const String sessionKey = "isLoggedIn";

  @override
  void onInit() {
    super.onInit();
    checkLoginSession();
  }

  //Login Method
  Future<String?> login(String email, String password) async {
    isLoading.value = true;
    try {
      if (email != 'Test123@gmail.com') {
        return "Email not found";
      }
      if (password != 'Test@123') {
        return "Incorrect Password";
      }
      isLoggedIn.value = true;
      await saveSession(true);
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  // FETCH USERS
  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;

      final users = await apiService.fetchUsers();
      userList.assignAll(users);
    } catch (e, stackTrace) {
      debugPrint("ERROR: $e");
      debugPrint("STACKTRACE: $stackTrace");

      Get.snackbar(
        "Error",
        "Failed to load users",
      );
    } finally {
      isLoading.value = false;
    }
  }

  // SAVE SESSION
  Future<void> saveSession(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(sessionKey, value);
  }

  // CHECK SESSION (NO NAVIGATION HERE!)
  Future<void> checkLoginSession() async {
    final prefs = await SharedPreferences.getInstance();
    bool? status = prefs.getBool(sessionKey);

    if (status == true) {
      isLoggedIn.value = true;
    }
  }

  // LOGOUT
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(sessionKey);

    isLoggedIn.value = false;
    userList.clear();

    Get.offAllNamed(AppRoutes.login);
  }
}