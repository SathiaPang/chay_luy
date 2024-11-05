import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

sealed class LocalDatabase {
  static Future<bool> setData<T>(String key, T value) async {
    try {
      final _db = await SharedPreferences.getInstance();
      if (value is String) {
        return _db.setString(key, value);
      } else if (value is int) {
        return _db.setInt(key, value);
      } else if (value is double) {
        return _db.setDouble(key, value);
      } else if (value is bool) {
        return _db.setBool(key, value);
      } else {
        return false;
      }
    } catch (e) {
      e.printError();
      return false;
    }
  }

  static Future<T?> getData<T>(String key) async {
    try {
      final _db = await SharedPreferences.getInstance();
      return _db.get(key) as T;
    } catch (e) {
      e.printError();
      return null;
    }
  }
}
