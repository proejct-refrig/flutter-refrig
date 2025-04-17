// lib/utils/api_client.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String _baseUrl = 'https://your-backend.com'; // 🔁 실제 백엔드 주소로 변경

  /// 카카오 로그인 인가 코드 백엔드로 전송
  static Future<http.Response> postKakaoLoginCode(String? code) async {
    final url = Uri.parse('$_baseUrl/api/login/kakao');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'code': code}),
    );

    return response;
  }
}