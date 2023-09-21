import 'package:flutter/material.dart';
import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'backdrop.dart';
import 'model/product.dart';
import 'supplemental/cut_corners_border.dart';

import 'category_menu_page.dart';

final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: kShrinePink100,
        onPrimary: kShrineBrown900,
        secondary: kShrineBrown900,
        error: kShrineErrorRed,
      ),
      textTheme: _buildShrineTextTheme(base.textTheme),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: kShrinePink100,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: kShrineBrown900,
          ),
        ),
        floatingLabelStyle: TextStyle(
          color: kShrineBrown900,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            foregroundColor: kShrinePink400,
            backgroundColor: kShrineBrown900,
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: kShrinePink400,
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: kShrineBrown900,
        backgroundColor: kShrinePink100,
      ));
}

class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  State<ShrineApp> createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/': (BuildContext context) => Backdrop(
              currentCategory: _currentCategory,
              frontLayer: HomePage(category: _currentCategory),
              backLayer: CategoryMenuPage(
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap,
              ),
              frontTitle: const Text('SHRINE'),
              backTitle: const Text('MENU'),
            ),
      },
      theme: _kShrineTheme,
    );
  }
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headlineSmall: base.headlineSmall!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        titleLarge: base.titleLarge!.copyWith(
          fontSize: 18.0,
        ),
        bodySmall: base.bodySmall!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyLarge: base.bodyLarge!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}
