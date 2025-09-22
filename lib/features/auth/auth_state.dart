import 'package:flutter/foundation.dart';
import '../../core/storage/app_prefs.dart';
import 'auth_repository.dart';

class AuthState extends ChangeNotifier {
  final AppPrefs prefs;
  AuthRepository? _repo;

  bool _loggedIn = false;
  bool get isLoggedIn => _loggedIn;

  AuthState({required this.prefs}) {
    _loggedIn = (prefs.token != null && prefs.token!.isNotEmpty);
  }

  void attachRepo(AuthRepository repo) {
    _repo = repo;
  }

  Future<void> login(String username, String password) async {
    final token = await _repo?.login(username, password);
    await prefs.setToken(token);
    _loggedIn = token != null && token.isNotEmpty;
    notifyListeners();
  }

  Future<void> logout() async {
    await prefs.setToken(null);
    _loggedIn = false;
    notifyListeners();
  }
}