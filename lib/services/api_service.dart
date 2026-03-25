import 'package:userinformationapi/utils/app_imports.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>> fetchUsers()async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    print("Fetching users from URL: $url");
    final response = await http.get(
     url,
     headers: {
       'Accept' : 'application/json',
       'User-Agent' : 'FlutterApp',
     },
    );
    print("Response status code: ${response.statusCode}");
    print("response body: ${response.body}");

    if(response.statusCode == 200){
      final List jsonData = json.decode(response.body);
      print("Decoded JSON length: ${jsonData.length}");
      return jsonData.map((json) => UserModel.fromJson(json)).toList();
    } else {
       print("Failed to load users");
       throw Exception("Failed to load users");
    }
  }
}