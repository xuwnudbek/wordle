class Letter {
  final String char;
  final bool inTruePlace;
  final bool isThereInTheLetter;

  Letter({
    this.char = "#",
    this.inTruePlace = false,
    this.isThereInTheLetter = false,
  });

  @override
  String toString() {
    return "Letter(char: $char, inTruePlace: $inTruePlace, isThereInTheLetter: $isThereInTheLetter)";
  }

  Letter copyWith({
    String? text,
    bool? inTruePlace,
    bool? isThereInTheLetter,
  }) {
    return Letter(
      char: text ?? this.char,
      inTruePlace: inTruePlace ?? this.inTruePlace,
      isThereInTheLetter: isThereInTheLetter ?? this.isThereInTheLetter,
    );
  }
}
