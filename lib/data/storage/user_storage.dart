import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> saveUserTel(String userTel) async {
    await _storage.write(key: 'userTel', value: userTel);
  }

  Future<String?> getUserTel() async {
    return await _storage.read(key: 'userTel');
  }

  Future<void> deleteUserTel() async {
    await _storage.delete(key: 'userTel');
  }
}
