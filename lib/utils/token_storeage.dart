// lib/utils/token_storage.dart
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const _key = 'jwt_token';

  /// JWT 저장
  static Future<void> saveJwtToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, token);
  }

  /// JWT 불러오기
  static Future<String?> getJwtToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  /// JWT 삭제 (로그아웃용)
  static Future<void> clearJwtToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}