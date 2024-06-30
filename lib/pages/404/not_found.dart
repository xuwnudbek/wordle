import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle/utils/rgb.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RGB.saddleBrown,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "404",
              style: TextStyle(
                fontFamily: "JungleRegular",
                fontSize: 140,
                fontWeight: FontWeight.w600,
                color: RGB.wheat,
              ),
            ),
            SizedBox(height: 16.0),
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: RGB.wheat75,
                foregroundColor: RGB.wheat,
              ),
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              ),
              label: Text(
                "back ",
                style: TextStyle(
                  fontFamily: "JungleRegular",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
