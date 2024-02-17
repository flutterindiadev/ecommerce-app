import 'package:shared_preferences/shared_preferences.dart';

class Sharedprefs {
  late SharedPreferences _prefs;

  Future setVal({required String key, required String val}) async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(key, val);
  }

  Future<String?> getVal({required String key}) async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(key);
  }

  Future clear() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
  }
}
