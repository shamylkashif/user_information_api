import 'package:userinformationapi/utils/app_imports.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});

  final UserModel user = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ADDRESS CARD
            _buildCard(
              title: "Address",
              value:
              "${user.street}, ${user.city} - ${user.zipcode}",
              icon: Icons.location_on,
            ),

            // COMPANY CARD
            _buildCard(
              title: "Company",
              value: user.companyName,
              icon: Icons.business,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}