import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_refrig_project/screens/home_screen.dart';
import 'package:flutter_refrig_project/utils/api_client.dart';
import 'package:flutter_refrig_project/utils/token_storeage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KakaoAuthService {
  static void openKakaoLogin(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            if (request.url.startsWith("yourapp://oauth")) {
              final uri = Uri.parse(request.url);
              final code = uri.queryParameters['code'];
              print(code);

              if (code != null) {
                print("카카오 로그인 인가 코드: $code");
                sendCodeToBackend(context, code); // 여기에 코드 전송
              } else {
                print("인가 코드 없음");
              }

              Navigator.pop(context);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
        "https://kauth.kakao.com/oauth/authorize"
            "?client_id=카카오_네이티브앱키"
            "&redirect_uri=yourapp://oauth"
            "&response_type=code",
      ));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text("카카오 로그인")),
          body: WebViewWidget(controller: controller),
        ),
      ),
    );
  }

  static Future<void> sendCodeToBackend(BuildContext context, String? code) async {
    if (code == null) {
      print("인가 코드 없음");
      return;
    }

    final response = await ApiClient.postKakaoLoginCode(code);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final jwt = responseBody['token']; // 뭘로 내려주는지 키값 확인 필요함

      await TokenStorage.saveJwtToken(jwt); // JWT 토큰 저장하는 함수 호출

      if (!context.mounted) return; // 비동기 이후에도 context가 유효한지 확인
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen())
      );
    } else {
      print("백엔드 로그인 실패");
    }
  }
}