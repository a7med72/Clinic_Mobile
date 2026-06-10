import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper{
  SecureStorageHelper._();

///save data to secure storage by key and value
  static Future<void> setDataSecure(String key, String value) async {
    debugPrint('Setting secure storage with key: $key and value: $value');
    final storage = FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }

  /// get data from secure storage by key
  static Future<String?> getDataSecure(String key) async {
    debugPrint('Getting secure storage with key: $key');
    final storage = FlutterSecureStorage();
    return await storage.read(key: key);
  }

  /// Remove secure storage data by key
  static Future<void> removeDataSecure(String key) async {
    debugPrint('Removing secure storage with key: $key');
    final storage = FlutterSecureStorage();
    await storage.delete(key: key);
  }

  /// Clear all secure storage data
  static Future<void> clearDataSecure() async {
    debugPrint('Clearing all secure storage data');
    final storage = FlutterSecureStorage();
    await storage.deleteAll();
  }

}