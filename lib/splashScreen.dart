import 'package:flutter/material.dart';
import 'package:online_exam_test/adminHomeScreen.dart';
import 'package:online_exam_test/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return const AdminHomeScreen();
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Positioned.fill(
          //     child: Assets.img.splash.image(fit: BoxFit.cover)),
          Center(
            child: Image.asset(
              'assets/img/logo.png',
              width: 100,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
