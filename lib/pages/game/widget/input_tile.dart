import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/models/letter.dart';
import 'package:wordle/pages/game/provider/game_provider.dart';
import "package:wordle/utils/rgb.dart";

class InputTile extends StatelessWidget {
  final int index;

  InputTile({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, provider, _) {
      Letter letter = provider.board[index];

      bool hasFocus = provider.cursor == index;
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: hasFocus ? 2 : 0.5,
            color: hasFocus ? RGB.saddleBrown : Colors.black,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        alignment: Alignment.center,
        child: Text(
          letter.char,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      );
    });
  }
}
