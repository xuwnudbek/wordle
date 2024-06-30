import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle/pages/home/provider/home_provider.dart';
import 'package:wordle/utils/rgb.dart';
import 'package:provider/provider.dart';
import 'package:wordle/utils/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
        create: (context) => HomeProvider(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Wordle',
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Container(
                    height: Get.width * .7,
                    width: Get.width * .7,
                    color: RGB.wheat,
                  ),
                  SizedBox(height: 100.0),
                  TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: Size(Get.width * .8, 50),
                      backgroundColor: RGB.saddleBrown,
                      foregroundColor: RGB.wheat,
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.game);
                    },
                    child: Text(
                      "Boshlash",
                      style: TextStyle(
                        color: RGB.wheat,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        style: TextButton.styleFrom(
                          fixedSize: Size(50, 50),
                          backgroundColor: RGB.wheat75,
                          // foregroundColor: RGB.wheat,
                          foregroundColor: RGB.saddleBrown,
                        ),
                        tooltip: "Settings",
                        onPressed: () {
                          Get.toNamed(Routes.settings);
                        },
                        icon: Icon(Icons.settings_rounded),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          );
        });
  }
}
