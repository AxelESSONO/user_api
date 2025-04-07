import 'package:user_api/model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  final String baseUrl = 'https://reqres.in/api/users';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List users = data['data'];
      return users.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Échec du chargement des utilisateurs');
    }
  }
}