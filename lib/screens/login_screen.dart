import 'package:userinformationapi/utils/app_imports.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final UserController controller = Get.find<UserController>();

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.lock_outline, size: 80, color: Colors.blueAccent,),
                        const SizedBox(height: 10),
                        const Text("Welcome Back", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),),
                        const SizedBox(height: 5),
                        const Text("Login to continue", style: TextStyle(color: Colors.grey),),

                        const SizedBox(height: 25),

                        // EMAIL
                        TextFormField(
                          controller: emailC,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => Validators.validateEmail(value ?? ""),
                        ),

                        const SizedBox(height: 15),

                        // PASSWORD
                        TextFormField(
                          controller: passC,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => Validators.validatePassword(value ?? ""),
                        ),

                        const SizedBox(height: 25),

                        // BUTTON
                        Obx(() {
                          return controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                final result = await controller.login(
                                  emailC.text.trim(),
                                  passC.text.trim(),
                                );

                                if (result == null) {
                                  await controller.fetchUsers();
                                  Get.offAllNamed(AppRoutes.dashboard);
                                } else {
                                  Get.snackbar("Login Failed", result);
                                }
                              }
                            },
                            child: const Text("Login"),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}