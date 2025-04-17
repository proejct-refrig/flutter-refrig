import 'package:flutter/material.dart';
import 'package:flutter_refrig_project/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(), // 앱 처음 시작 시 로그인 화면 띄움!
    );
  }
}