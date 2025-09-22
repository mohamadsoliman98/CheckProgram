import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final http.Client _client;
  ApiClient({required this.baseUrl, http.Client? client}) : _client = client ?? http.Client();

  Future<Map<String, dynamic>> postJson(String path, Map<String, dynamic> body, {Map<String, String>? headers}) async {
    final resp = await _client.post(Uri.parse('$baseUrl$path'),
      headers: {'Content-Type': 'application/json', ...?headers},
      body: jsonEncode(body),
    );
    if (resp.statusCode >= 200 && resp.statusCode < 300) {
      return jsonDecode(resp.body) as Map<String, dynamic>;
    }
    throw Exception('HTTP ${resp.statusCode}: ${resp.body}');
  }

  Future<Map<String, dynamic>> getJson(String path, {Map<String, String>? headers}) async {
    final resp = await _client.get(Uri.parse('$baseUrl$path'),
      headers: {'Accept': 'application/json', ...?headers},
    );
    if (resp.statusCode >= 200 && resp.statusCode < 300) {
      return jsonDecode(resp.body) as Map<String, dynamic>;
    }
    throw Exception('HTTP ${resp.statusCode}: ${resp.body}');
  }
}