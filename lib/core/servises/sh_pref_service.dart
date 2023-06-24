import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  //todo remove s and inject it like other classes
  //todo care about init in [main.dart]
   late SharedPreferences _preferences;

   Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

   Future<bool> containsKey(String key) async {
    await init();
    return _preferences.containsKey(key);
  }

   Future<void> setString(String key, String value) async {
    await init();
    await _preferences.setString(key, value);
  }

   Future<String> getString(String key) async {
    await init();
    return _preferences.getString(key) ?? '';
  }

   Future<void> setInt(String key, int value) async {
    await init();
    await _preferences.setInt(key, value);
  }

   Future<int> getInt(String key) async {
    await init();
    return _preferences.getInt(key) ?? 00;
  }

   Future<void> setDouble(String key, double value) async {
    await init();
    await _preferences.setDouble(key, value);
  }

   Future<double> getDouble(String key) async {
    await init();
    return _preferences.getDouble(key) ?? 0.0;
  }

   Future<void> remove(String key) async {
    await init();
    await _preferences.remove(key);
  }

   Future<void> clear() async {
    await init();
    await _preferences.clear();
  }
}
