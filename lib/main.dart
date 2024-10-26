import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:expenses_app/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
); // global variables convention to start with 'k'

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness
      .dark, // tell flutter this is a color scheme for dark brightness
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  // line 17-21 => lock the device orientation
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]).then((fn) {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      cardTheme: const CardTheme().copyWith(
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer),
      ),
    ),
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        // copyWith即係 - 所有嘢都跟你default啦，除咗以下我set呢d之外
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          )),
    ),
    themeMode:
        ThemeMode.system, // default is based on system theme, so no need to set
    home: Expenses(),
  ));
  // });
}
