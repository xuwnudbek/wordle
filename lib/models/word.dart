import 'package:wordle/models/letter.dart';

class Word {
  final List<Letter> letters;
  final bool inTruePlace;
  final bool isThereInTheWord;

  Word({
    this.letters = const [],
    this.inTruePlace = false,
    this.isThereInTheWord = false,
  });

  @override
  String toString() {
    return "Word(letters: $letters, inTruePlace: $inTruePlace, isThereInTheWord: $isThereInTheWord)";
  }

  String get string => letters.fold("", (prev, element) => prev + element.char);

  bool isEqual(Word word) {
    List<bool> equal = [];
    for (var i = 0; i < 5; i++) {
      equal.add(letters[i].char.toLowerCase() == word.letters[i].char.toLowerCase());
    }

    return !equal.contains(false);
  }

  Word copyWith({
    List<Letter>? letters,
    bool? inTruePlace,
    bool? isThereInTheWord,
  }) {
    return Word(
      letters: letters ?? this.letters,
      inTruePlace: inTruePlace ?? this.inTruePlace,
      isThereInTheWord: isThereInTheWord ?? this.isThereInTheWord,
    );
  }
}
