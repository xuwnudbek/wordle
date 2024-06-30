import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wordle/models/letter.dart';
import 'package:wordle/pages/game/provider/game_provider.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gameProvider, _) {
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                _buildKey("Q"),
                _buildKey("O`"),
                _buildKey("E"),
                _buildKey("R"),
                _buildKey("T"),
                _buildKey("Y"),
                _buildKey("U"),
                _buildKey("I"),
                _buildKey("O"),
                _buildKey("P"),
              ],
            ),
            Row(
              children: [
                _buildKey("A"),
                _buildKey("S"),
                _buildKey("D"),
                _buildKey("F"),
                _buildKey("G"),
                _buildKey("H"),
                _buildKey("J"),
                _buildKey("K"),
                _buildKey("L"),
              ],
            ),
            Row(
              children: [
                _buildKey("Z"),
                _buildKey("X"),
                _buildKey("C"),

                _buildKey("V"),
                _buildKey("B"),
                _buildKey("N"),

                _buildKey("M"),
                //backspace button
                _buildKey(""),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${gameProvider.word.string}",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildKey(String key) {
    return Consumer<GameProvider>(builder: (context, provider, _) {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            if (provider.isLoading) return;

            if (key.isEmpty) {
              provider.backspace();
              return;
            }

            Letter letter = Letter(char: key);

            provider.typeKey(letter);
          },
          child: Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Center(
              child: Text(
                key.isEmpty ? "←" : key,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
