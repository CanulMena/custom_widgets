import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.lightBlue,
  Colors.blue,
  Colors.lightBlueAccent,
  Colors.blueGrey,
  Colors.orange,
  Colors.orangeAccent,
  Colors.deepOrange
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false,
    this.selectedColor = 0
  }) : 
  assert(selectedColor >= 0, 'selectedColor must be greater than 0'),
  assert(selectedColor <= colorList.length -1, 'selectedColor must be less or equal than ${colorList.length - 1}' );

  ThemeData getTheme() => ThemeData(
    brightness: isDarkMode ? Brightness.dark : Brightness.light ,
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
  );
}
