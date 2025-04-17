import 'package:flutter/material.dart';
import 'package:flutter_refrig_project/screens/home_screen.dart';
import 'package:flutter_refrig_project/services/kakao_auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double _opacity1 = 0;
  double _opacity2 = 0;
  double _opacity3 = 0;

  @override
  void initState() {
    super.initState();

    // 순차적으로 등장하게 만들기
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() => _opacity1 = 1);
    });

    Future.delayed(const Duration(milliseconds: 1600), () {
      setState(() => _opacity2 = 1);
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() => _opacity3 = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 600),
                opacity: _opacity1,
                child: Image.asset(
                  'assets/refrig_logo.png',
                  width: 200,
                  height: 200,
                ),
              ),

              const SizedBox(height: 20),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 600),
                opacity: _opacity2,
                child: const Text(
                  '어서오세요!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 20),

              const Spacer(),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 600),
                opacity: _opacity2,
                child: const Text(
                  '로그인 후 서비스를 이용해보세요.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 20),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 600),
                opacity: _opacity3,
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      // here : 카카오 로그인 처리
                      KakaoAuthService.openKakaoLogin(context);

                      // 우선은 그냥 홈 스크린으로 가도록 설정
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => const HomeScreen())
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Image.asset(
                      'assets/kakao_login_medium_wide.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}