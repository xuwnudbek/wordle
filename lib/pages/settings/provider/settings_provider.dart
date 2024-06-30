import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wordle/services/storage_service.dart';

class SettingsProvider extends ChangeNotifier {
  int counter = 0;
  bool isLoading = false;
  bool isWordsUpdating = false;
  bool areThereNewWords = false;

  SettingsProvider() {
    // getWordsFromAssets();
    initial();
  }

  initial() async {
    counter = StorageService.words.length;
    areThereNewWords = await StorageService.areThereNewWords;
    notifyListeners();
  }

  Future getWordsFromAssets() async {
    isWordsUpdating = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));
    List<String> words = [];
    await rootBundle.loadString("assets/words/words.txt").then((value) {
      words = value.split(",");
    });

    counter = words.length;

    if (words.length != StorageService.words.length) {
      StorageService.write(
          "words",
          words
            ..shuffle()
            ..shuffle()
            ..shuffle());
    }

    isWordsUpdating = false;
    notifyListeners();
  }

  void updateSettings() {
    notifyListeners();
  }
}
