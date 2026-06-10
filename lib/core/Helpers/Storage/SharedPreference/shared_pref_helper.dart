import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  /// Remove shared preference by key
  static Future<void> removeData(String key) async {
    debugPrint('Removing shared preference with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Clear all shared preference data
  static Future<void> clearData() async {
    debugPrint('Clearing all shared preferences');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// save data to shared preference by key and value
  static Future<void> setData(String key, Object? value) async {
    debugPrint('Setting shared preference with key: $key and value: $value');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    } else if (value == null) {
      await sharedPreferences.remove(key);
    } else {
      throw Exception('Unsupported data type: ${value.runtimeType}');
    }
  }

  /// get data from shared preference by key
  static Future<T?> getData<T>(String key) async {
    debugPrint('Getting shared preference with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (T == String) {
      return sharedPreferences.getString(key) as T?;
    } else if (T == int) {
      return sharedPreferences.getInt(key) as T?;
    } else if (T == bool) {
      return sharedPreferences.getBool(key) as T?;
    } else if (T == double) {
      return sharedPreferences.getDouble(key) as T?;
    } else if (T == dynamic || T == Object) {
      return sharedPreferences.get(key) as T?;
    } else {
      throw Exception('Unsupported data type: $T');
    }
  }

  /// Check if shared preference key exists
  static Future<bool> containsKey(String key) async {
    debugPrint('Checking if shared preference contains key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey(key);
  }
}
