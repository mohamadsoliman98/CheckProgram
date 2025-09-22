import '../../core/network/api_client.dart';

class AuthRepository {
  final ApiClient api;
  AuthRepository(this.api);

  Future<String?> login(String username, String password) async {
    // TODO: replace with real endpoint of Sham Cash backend
    final resp = await api.postJson('/auth/login', {
      'username': username,
      'password': password,
    });
    return resp['token'] as String?;
  }
}