import 'package:wordle/models/letter.dart';

extension StringExtension on String {
  List<Letter> get toLetters {
    List<Letter> letters = this.split("").map((e) => Letter(char: e)).toList();
    return letters;
  }
}
