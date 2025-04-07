import 'package:flutter/material.dart';

import '../model/api_service.dart';
import '../model/user.dart';

class UserViewModel extends ChangeNotifier {

  final ApiService _apiService = ApiService();

  List<User> _users = [];
  bool _isLoading = false;
  List<User> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();
    try {
      _users = await _apiService.fetchUsers();
    } catch (e) {
      print('Erreur : $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}