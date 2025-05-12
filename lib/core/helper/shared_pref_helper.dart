import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? _sharedPreferences;
  static const FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  SharedPrefHelper._();

  static Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    await _sharedPreferences?.remove(key);
  }

  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    await _sharedPreferences?.clear();
  }

  static Future<void> setData(String key, dynamic value) async {
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case String:
        await _sharedPreferences?.setString(key, value);
        break;
      case int:
        await _sharedPreferences?.setInt(key, value);
        break;
      case bool:
        await _sharedPreferences?.setBool(key, value);
        break;
      case double:
        await _sharedPreferences?.setDouble(key, value);
        break;
      default:
        return;
    }
  }

  static bool getBool(String key)  {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    return _sharedPreferences?.getBool(key) ?? false;
  }

  static Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    return _sharedPreferences?.getDouble(key) ?? 0.0;
  }

  static Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    return _sharedPreferences?.getInt(key) ?? 0;
  }

  static Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper : getString with key : $key');
    return _sharedPreferences?.getString(key) ?? '';
  }

  static Future<void> setSecuredString(String key, String value) async {
    debugPrint("FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await _flutterSecureStorage.write(key: key, value: value);
  }

  static Future<String> getSecuredString(String key) async {
    debugPrint('FlutterSecureStorage : getSecuredString with key : $key');
    return await _flutterSecureStorage.read(key: key) ?? '';
  }

  static Future<void> removeSecuredString(String key) async {
    debugPrint('FlutterSecureStorage : removeSecuredString with key : $key');
    await _flutterSecureStorage.delete(key: key);
  }

  static Future<void> clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    await _flutterSecureStorage.deleteAll();
  }
}
