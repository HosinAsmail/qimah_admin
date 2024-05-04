extension NumberExtensions on String {
  int toInt() {
    return int.parse(this);
  }

  double toDouble() {
    return double.parse(this);
  }

  bool get hasFractionalDigits {
    // Define a regular expression pattern to match any digit that is not zero
    try {
      RegExp regex = RegExp(r'[1-9]');
      List<String> parts = split('.');

      // Check if the split operation produces two parts (before and after the decimal point)
      if (parts.length == 2) {
        // Use allMatches to find all non-zero digits in the text
        Iterable<Match> matches = regex.allMatches(split('.')[1]);
        return matches.isNotEmpty;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }

    // If no non-zero digits are found, the string contains only zeros
  }

  String toStringWithNoDigitsIFZerosOnly(int numberDigits) {
    return toDouble().toStringAsFixed(hasFractionalDigits ? numberDigits : 0);
  }
}
