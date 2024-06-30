// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle/models/letter.dart';
import 'package:wordle/models/word.dart';
import 'package:wordle/services/storage_service.dart';
import 'package:wordle/utils/extensions.dart';

enum GameStatuses { initial, inPreparing, inProgress, finished, rePreparing }

class GameProvider extends ChangeNotifier {
  GameStatuses gameStatus = GameStatuses.initial;
  List<Word> words = [];
  List<Word> usedWords = [];
  Word word = Word();
  int lettersLimit = 5;
  int chanseLimit = 5;

  int activeRow = 0;
  int cursor = 0;
  List<Letter> board = List.generate(25, (index) => Letter());

  bool get areThereEnoughWords => StorageService.words.length >= StorageService.chanceLimit;

  bool isLoading = false;

  //Default constructor
  GameProvider() {
    initGame();
  }

  Future<void> initGame() async {
    gameStatus = GameStatuses.inPreparing;
    notifyListeners();

    await Future(() {
      words = StorageService.words.map((e) => Word(letters: (e as String).toLetters)).toList();
      usedWords = StorageService.usedWords.map((e) => Word(letters: (e as String).toLetters)).toList();

      words..shuffle();
      word = words.elementAt(Random.secure().nextInt(words.length));

      notifyListeners();
    });

    gameStatus = GameStatuses.inProgress;
    notifyListeners();
  }

  ///Game methods
  void typeKey(Letter letter) {
    //type to board
    board[cursor] = letter;
    notifyListeners();

    if (cursor % 5 == 4) {
      Word word = Word(letters: board.sublist(cursor - 4, cursor + 1));

      var isThereThisWord = checkWord(word);

      if (!isThereThisWord) {
        Get.snackbar("Error", "Bunday so'z topilmadi!");
        return;
      }

      incActiveRow();
    }

    if (cursor == 24) return;
    cursor += 1;

    notifyListeners();
  }

  void incActiveRow() {
    if (activeRow == 4) {
      finish();
      return;
    }

    activeRow += 1;
    notifyListeners();
  }

  void backspace() {
    board[cursor] = Letter();
    notifyListeners();

    if (activeRow != cursor ~/ 5) return;
    if (cursor == 0) return;
    cursor--;

    notifyListeners();
  }

  bool checkWord(Word word) {
    isLoading = true;
    notifyListeners();

    // await Future.delayed(Duration(seconds: 1));

    var checkWord = words.any((element) => element.isEqual(word));

    isLoading = false;
    notifyListeners();

    return checkWord;
  }

  void finish() {
    //Game finished
    print("Game finished");
    return;
  }
}
