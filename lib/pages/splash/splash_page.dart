import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle/utils/rgb.dart';
import 'package:wordle/utils/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initTimer() {
    Timer(
      const Duration(seconds: 2),
      () => Get.offAllNamed(Routes.home),
    );
  }

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RGB.saddleBrown,
      body: Center(
        child: Text(
          'Wordle',
          style: TextStyle(
            color: RGB.wheat,
            fontSize: 72.0,
            shadows: [
              Shadow(
                color: RGB.brown,
                offset: const Offset(0.0, 4.0),
                blurRadius: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
