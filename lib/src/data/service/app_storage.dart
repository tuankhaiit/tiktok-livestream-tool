import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static String defaultUniqueId = 'amibo2020';
  static String uniqueKey = '';
  static final AppStorage _instance = AppStorage._internal();

  AppStorage._internal();

  factory AppStorage() {
    return _instance;
  }

  Future<SharedPreferences> getStorage() => SharedPreferences.getInstance();

  // Future<String?> getUniqueId() async {
  //   final storage = await getStorage();
  //   final uniqueId = storage.getString(uniqueKey) ?? defaultUniqueId;
  //   if (uniqueId.isNotEmpty) return uniqueId;
  //   return defaultUniqueId;
  // }
  //
  // Future<bool> setUniqueId(String uniqueId) async {
  //   final storage = await getStorage();
  //   return storage.setString(uniqueKey, uniqueId);
  // }
}