import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences storage;

  StorageService({required this.storage});

  Future<void> saveString(String key, String value) async {
    await storage.setString(key, value);
  }

  Future<String?> getString(String key) async {
    return storage.getString(key);
  }
}
