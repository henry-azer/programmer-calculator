import 'dart:math';

/// this class used to convert
/// between numbers types
/// lib for generic usage
/// @Author Henry Azer
/// @since 28/10/2022
class NumberConverter {
  /// convert binary to decimal
  /// accept string and return string
  static String convertBinaryToDecimal(String binary) {
    return int.parse(binary.trim(), radix: 2).toString();
  }

  /// convert binary to hexadecimal
  /// accept string and return string
  static String convertBinaryToHexadecimal(String binary) {
    Map<String, String> hexadecimalTableMap = {
      "0000": '0',
      "0001": '1',
      "0010": '2',
      "0011": '3',
      "0100": '4',
      "0101": '5',
      "0110": '6',
      "0111": '7',
      "1000": '8',
      "1001": '9',
      "1010": 'A',
      "1011": 'B',
      "1100": 'C',
      "1101": 'D',
      "1110": 'E',
      "1111": 'F',
    };

    // make right substring length divisible by 4
    var binaryLength = binary.length;
    for (int i = 1; i <= (4 - binaryLength % 4) % 4; i++) {
      binary = '0$binary';
    }

    // converting binary value to hexadecimal
    int counter = 0;
    String hexadecimalValue = "";
    while (counter != binary.length) {
      String currentBinaryValue = binary.substring(counter, counter + 4);
      hexadecimalValue += hexadecimalTableMap[currentBinaryValue]!;
      counter += 4;
    }

    return hexadecimalValue;
  }

  /// convert binary to octal
  /// accept string and return string
  static String convertBinaryToOctal(String binary) {
    // parse string binary to int binary
    int binaryParsed = int.parse(binary);

    // converting binary value to octal
    int counter = 1;
    String octalValue = "";
    int currentBinaryValue;
    while (binaryParsed > 0) {
      int code = 0;

      for (int i = 0; i < 3; i++) {
        currentBinaryValue = binaryParsed % 10;
        binaryParsed = binaryParsed ~/ 10;
        code += currentBinaryValue * counter;
        counter *= 2;
      }

      octalValue = code.toString() + octalValue;
      counter = 1;
    }

    return octalValue;
  }

  /// convert decimal to binary
  /// accept string and return string
  static String convertDecimalToBinary(String decimal) {
    return int.parse(decimal).toRadixString(2);
  }

  /// convert decimal to hexadecimal
  /// accept string and return string
  static String convertDecimalToHexadecimal(String decimal) {
    return convertBinaryToHexadecimal(convertDecimalToBinary(decimal));
  }

  /// convert decimal to octal
  /// accept string and return string
  static String convertDecimalToOctal(String decimal) {
    return convertBinaryToOctal(convertDecimalToBinary(decimal));
  }

  /// convert hexadecimal to binary
  /// accept string and return string
  static String convertHexadecimalToBinary(String hexadecimal) {
    return int.parse(hexadecimal, radix: 16).toRadixString(2);
  }

  /// convert hexadecimal to decimal
  /// accept string and return string
  static String convertHexadecimalToDecimal(String hexadecimal) {
    return BigInt.parse(hexadecimal, radix: 16).toString();
  }

  /// convert hexadecimal to octal
  /// accept string and return string
  static String convertHexadecimalToOctal(String hexadecimal) {
    return convertDecimalToOctal(convertHexadecimalToDecimal(hexadecimal));
  }

  /// convert octal to binary
  /// accept string and return string
  static String convertOctalToBinary(String octal) {
    return convertDecimalToBinary(convertOctalToDecimal(octal));
  }

  /// convert octal to decimal
  /// accept string and return string
  static String convertOctalToDecimal(String octal) {
    // parse string binary to int binary
    int octalParsed = int.parse(octal);

    // converting octal value to decimal
    int counter = 0;
    int? decimalValue = 0;
    while (octalParsed != 0) {
      decimalValue = (decimalValue! + ((octalParsed % 10) * pow(8, counter))) as int?;
      counter++;
      octalParsed = octalParsed ~/ 10;
    }

    return decimalValue.toString();
  }

  /// convert octal to hexadecimal
  /// accept string and return string
  static String convertOctalToHexadecimal(String octal) {
    return convertDecimalToHexadecimal(convertOctalToDecimal(octal));
  }
}
