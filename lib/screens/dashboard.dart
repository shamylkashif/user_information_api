import 'package:userinformationapi/utils/app_imports.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final UserController controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.userList.isEmpty) {
        controller.fetchUsers();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.userList.isEmpty) {
          return const Center(child: Text("No users found"));
        }

        return ListView.builder(
          itemCount: controller.userList.length,
          itemBuilder: (context, index) {
            final user = controller.userList[index];

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Card(
                color: Colors.blue[50],
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(user.name[0]),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Text(user.id.toString()),
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.detail,
                      arguments: user,
                    );
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}