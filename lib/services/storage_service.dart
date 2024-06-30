import 'dart:math';

import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

class StorageService {
  static GetStorage box = GetStorage("wordle");

  static Future<void> init(String name) async {
    await GetStorage.init(name);

    GetStorage initBox = GetStorage(name);

    if (!initBox.hasData("user_id")) {
      await initBox.write("user_id", Random.secure().nextInt(8999999) + 1000000);
    }
  }

  //Basic methods
  static read(key) {
    return box.read(key);
  }

  static write(key, value) async {
    await box.write(key, value);
    box.save();
  }

  static remove(key) async {
    await box.remove(key);
    box.save();
  }

  static clear() {
    box.erase();
    box.save();
  }

  //additional methods, properties

  static void append(String word) {
    List<String> words = read("words");
    words.add(word);
    remove("words");
    write("words", words);
  }

  static Future<bool> get areThereNewWords async {
    var assetWords = await rootBundle.loadString("assets/words/words.txt");
    int assetWordsCount = assetWords.split(",").length;
    int storageWordsCount = StorageService.words.length;
    if (assetWordsCount > storageWordsCount) return true;

    return false;
  }

  static int get userId => read("user_id") ?? 0;

  static List get words => read("words") ?? [];

  static List get usedWords => read("used_words") ?? [];

  static String get word => read("word") ?? "";

  static int get lettersLimit {
    if (!box.hasData("letters_limit")) {
      write("letters_limit", 5);
    }
    return read("letters_limit");
  }

  static int get chanceLimit {
    if (!box.hasData("chance_limit")) {
      write("chance_limit", 5);
    }
    return read("chance_limit");
  }
}
