import 'package:flutter/material.dart';
import 'package:flutter_refrig_project/screens/login_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔥 플랫폼 구현체 초기화
  // WebViewPlatform.instance = AndroidWebView();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard'
      ),
      home: const LoginScreen(), // 앱 처음 시작 시 로그인 화면 띄움!
    );
  }
}