// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wordle/pages/game/provider/game_provider.dart';
import 'package:provider/provider.dart';
import 'package:wordle/pages/game/widget/input_tile.dart';
import 'package:wordle/pages/game/widget/keyboard.dart';
import 'package:wordle/utils/rgb.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameProvider>(
      create: (context) => GameProvider(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              color: RGB.wheat,
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            ),
            title: Text("Wordle"),
          ),
          body: Consumer<GameProvider>(
            builder: (context, gameProvider, _) {
              if (!gameProvider.areThereEnoughWords) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ma'lumotlar bazasida yetarlicha\n so'z mavjud emas!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: RGB.saddleBrown,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: RGB.saddleBrown75,
                          foregroundColor: RGB.wheat75,
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.download_rounded,
                          size: 32.0,
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (gameProvider.gameStatus == GameStatuses.initial || gameProvider.gameStatus == GameStatuses.inPreparing) {
                return Center(
                  child: SizedBox(
                    width: Get.width * .7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Tayyorlanmoqda..."),
                        SizedBox(height: 6.0),
                        LinearProgressIndicator(
                          color: RGB.saddleBrown,
                        ),
                      ],
                    ),
                  ),
                );
              }

              //In progress
              if (gameProvider.gameStatus == GameStatuses.inProgress) {
                return Column(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        width: Get.width * 8,
                        height: Get.width * 8,
                        // color: Colors.red,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            mainAxisSpacing: 6.0,
                            crossAxisSpacing: 6.0,
                          ),
                          itemCount: 25,
                          itemBuilder: (context, index) {
                            return InputTile(
                              index: index,
                            );
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.orange,
                        padding: EdgeInsets.all(8.0),
                        child: CustomKeyboard(),
                      ),
                    ),
                  ],
                );
              }

              return ErrorWidget("Error [Default]");
            },
          ),
        );
      },
    );
  }
}
