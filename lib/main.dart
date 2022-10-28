import 'dart:io';

import 'programmer_calculator.dart';

void main(List<String> arguments) {
  stdout.writeln("---Programmer Calculator---");
  stdout.writeln();

  stdout.writeln("---Calculator---");
  stdout.writeln("(1)HEX, (2)DEC, (3)OCT, (4)BIN");
  stdout.write("Choose conversion type: ");
  int type = int.parse(stdin.readLineSync()!);

  stdout.write("Enter value to convert: ");
  String value = stdin.readLineSync()!;

  Map conversions = ProgrammerCalculator.convertToAllTypes(type, value);
  stdout.writeln();
  stdout.writeln("---Results---");
  stdout.writeln(conversions);
}
