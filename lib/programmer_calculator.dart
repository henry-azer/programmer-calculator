import 'number_converter.dart';

/// this class used to convert
/// between numbers type to all types
/// @Author Henry Azer
/// @since 28/10/2022
class ProgrammerCalculator {

  /// convert number type to all types
  /// accept int type, string value and return map of results
  static Map convertToAllTypes(int type, String value) {
    // checking for unexpected values
    _checkIsTypeValid(type);
    _checkIsValueValid(value);

    // create map and convert depend on type conversion
    Map<String, String> numberConversions = {};
    if (type == 1) {
      _convertFromHexadecimal(value, numberConversions);
    } else if (type == 2) {
      _convertFromDecimal(value, numberConversions);
    } else if (type == 3) {
      _convertFromOctal(value, numberConversions);
    } else if (type == 4) {
      _convertFromBinary(value, numberConversions);
    }

    return numberConversions;
  }

  /// convert hexadecimal to all types
  /// accept string hexadecimal and map of numberConversions
  static void _convertFromHexadecimal(String hexadecimal, Map<String, String> numberConversions) {
    numberConversions.addAll({
      "DEC": NumberConverter.convertHexadecimalToDecimal(hexadecimal),
      "BIN": NumberConverter.convertHexadecimalToBinary(hexadecimal),
      "OCT": NumberConverter.convertHexadecimalToOctal(hexadecimal),
    });
  }

  /// convert decimal to all types
  /// accept string hexadecimal and map of numberConversions
  static void _convertFromDecimal(String decimal, Map<String, String> numberConversions) {
    numberConversions.addAll({
      "HEX": NumberConverter.convertDecimalToHexadecimal(decimal),
      "BIN": NumberConverter.convertDecimalToBinary(decimal),
      "OCT": NumberConverter.convertDecimalToOctal(decimal),
    });
  }

  /// convert octal to all types
  /// accept string hexadecimal and map of numberConversions
  static void _convertFromOctal(String octal, Map<String, String> numberConversions) {
    numberConversions.addAll({
      "HEX": NumberConverter.convertOctalToHexadecimal(octal),
      "BIN": NumberConverter.convertOctalToBinary(octal),
      "DEC": NumberConverter.convertOctalToDecimal(octal),
    });
  }

  /// convert binary to all types
  /// accept string hexadecimal and map of numberConversions
  static void _convertFromBinary(String binary, Map<String, String> numberConversions) {
    numberConversions.addAll({
      "HEX": NumberConverter.convertBinaryToHexadecimal(binary),
      "DEC": NumberConverter.convertBinaryToDecimal(binary),
      "OCT": NumberConverter.convertBinaryToOctal(binary),
    });
  }

  /// check is valid type value
  /// accept int type and throw format exception
  static void _checkIsTypeValid(int type) {
    if (type < 1 || type > 4) {
      throw FormatException("An invalid type conversion value was entered");
    }
  }

  /// check is valid type value
  /// accept string value and throw format exception
  static void _checkIsValueValid(String value) {
    value = value.trim();
    bool isNegative = value[0] == "-";

    if (value == "" || isNegative) {
      throw FormatException("An invalid conversion value was entered");
    }
  }
}
