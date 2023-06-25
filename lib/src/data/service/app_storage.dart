import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_tool/src/domain/model/account.dart';

class AppStorage {
  static String defaultUniqueId = 'amibo2020';
  static String accountKey = 'TiktokConnector_Sharef_accountKey';
  static String uniqueKey = 'TiktokConnector_Sharef_uniqueKey';
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

  Future<AccountModel?> getAccount() async {
    final storage = await getStorage();
    final string = storage.getString(accountKey);
    if (string?.isNotEmpty == true) {
      final json = jsonDecode(string!);
      return AccountModel.fromJson(json);
    }
    return null;
  }

  Future<bool> saveAccount(AccountModel account) async {
    final storage = await getStorage();
    return storage.setString(accountKey, jsonEncode(account.toJson()));
  }

  Future<bool> clearAccount() async {
    final storage = await getStorage();
    return storage.remove(accountKey);
  }
}
