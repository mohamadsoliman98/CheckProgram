import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  final SharedPreferences _sp;
  AppPrefs._(this._sp);

  static Future<AppPrefs> create() async {
    final sp = await SharedPreferences.getInstance();
    return AppPrefs._(sp);
  }

  static const _kToken = 'auth_token';

  String? get token => _sp.getString(_kToken);
  Future<void> setToken(String? v) async {
    if (v == null) {
      await _sp.remove(_kToken);
    } else {
      await _sp.setString(_kToken, v);
    }
  }
}