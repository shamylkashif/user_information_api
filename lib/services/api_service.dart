import 'package:userinformationapi/utils/app_imports.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>> fetchUsers()async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    debugPrint("Fetching users from URL: $url");
    final response = await http.get(
     url,
     headers: {
       'Accept' : 'application/json',
       'User-Agent' : 'FlutterApp',
     },
    );
    debugPrint("Response status code: ${response.statusCode}");
    debugPrint("response body: ${response.body}");

    if(response.statusCode == 200){
      final List jsonData = json.decode(response.body);
      debugPrint("Decoded JSON length: ${jsonData.length}");
      return jsonData.map((json) => UserModel.fromJson(json)).toList();
    } else {
       debugPrint("Failed to load users");
       throw Exception("Failed to load users");
    }
  }
}