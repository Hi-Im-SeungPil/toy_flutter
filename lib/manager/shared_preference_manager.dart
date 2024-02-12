import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  static Future<void> setData(String key, Object data) async {
    final prefs = await SharedPreferences.getInstance();

    switch (data.runtimeType) {
      case const (int):
        prefs.setInt(key, data as int);
        break;
      case const (String):
        prefs.setString(key, data as String);
        break;
      case const (bool):
        prefs.setBool(key, data as bool);
        break;
    }
  }

  static Future<Object?> getData(String key, String type) async {
    final prefs = await SharedPreferences.getInstance();

    switch (type) {
      case "int":
        return prefs.getInt(key);
      case "String":
        return prefs.getString(key);
      case "bool":
        return prefs.getBool(key);
      default:
        return null;
    }
  }
}
