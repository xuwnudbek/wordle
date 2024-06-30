import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:wordle/pages/settings/provider/settings_provider.dart';
import 'package:wordle/services/storage_service.dart';
import 'package:wordle/utils/rgb.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsProvider>(
      create: (context) => SettingsProvider(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Settings',
            ),
          ),
          body: Consumer<SettingsProvider>(
            builder: (context, settingsProvider, child) {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 16.0),
                      //profile picture
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: RGB.wheat,
                        child: Text(
                          'W',
                          style: TextStyle(
                            fontSize: 72.0,
                            color: RGB.saddleBrown,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'User ${StorageService.userId}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: Get.width * .9,
                        decoration: BoxDecoration(
                          color: RGB.wheat75,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        // padding: EdgeInsets.symmetric(vertical: 8.0),
                        alignment: Alignment.center,
                        child: ListTile(
                          dense: true,
                          title: Text.rich(
                            TextSpan(
                              text: 'Jami so`zlar: ',
                              children: [
                                TextSpan(
                                  text: "${settingsProvider.counter}",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                TextSpan(text: " ta"),
                              ],
                            ),
                            style: TextStyle(
                              fontSize: 20,
                              // fontFamily: "Poppins",data
                              color: RGB.saddleBrown,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                "barcha so`zlar 5 ta harfdan iborat",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          contentPadding: EdgeInsets.only(left: 12.0, right: 12.0),
                          trailing: SizedBox(
                            width: 100,
                            child: TextButton(
                              style: settingsProvider.areThereNewWords
                                  ? TextButton.styleFrom(
                                      backgroundColor: RGB.wheat,
                                      elevation: 10.0,
                                    )
                                  : TextButton.styleFrom(
                                      backgroundColor: RGB.wheat175,
                                    ),
                              onPressed: () {
                                settingsProvider.getWordsFromAssets();
                              },
                              child: Text(
                                settingsProvider.areThereNewWords ? "Yangilash" : "Yangilangan",
                                style: settingsProvider.areThereNewWords
                                    ? TextStyle(
                                        color: RGB.saddleBrown,
                                      )
                                    : TextStyle(
                                        color: RGB.saddleBrown75,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6.0),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
