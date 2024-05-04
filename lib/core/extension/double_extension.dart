extension NumberExtensions on double {
  bool get hasFractionalDigits {
    // Define a regular expression pattern to match any digit that is not zero
    try {
      RegExp regex = RegExp(r'[1-9]');

      List<String> parts = toString().split('.');

      // Check if the split operation produces two parts (before and after the decimal point)
      if (parts.length == 2) {
        // Use allMatches to find all non-zero digits in the text
        Iterable<Match> matches = regex.allMatches(toString().split('.')[1]);
        return matches.isNotEmpty;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }

    // If no non-zero digits are found, the string contains only zeros
  }
}
