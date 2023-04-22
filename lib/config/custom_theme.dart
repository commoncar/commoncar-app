import 'package:commoncar_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static Color get primaryExtraLightColor => const Color(0xFFFFF3F7);
  static Color get primaryLighterColor => const Color(0xFFFFE8F0);
  static Color get primaryLightColor => const Color(0xFFFFB0C3);
  static Color get primaryColor => const Color(0xFFF5426C);
  static Color get accentColor => const Color(0xFF1E1A34);
  static Color get accentMediumColor => const Color(0xFF1E26DC);
  static Color get neutralsLighterColor => const Color(0xFFF2F3F6);
  static Color get neutralsLightColor => const Color(0xFFE6E7F0);
  static Color get neutralsLightMediumColor => const Color(0xFFBBBFDB);
  static Color get neutralsDarkColor => const Color(0xFF5B5F7E);
  static Color get neutralsDarkMediumColor => const Color(0xFF898CAC);
  static Color get neutralsDarkerColor => const Color(0xFF1E1A34);
  static Color get semanticErrorColor => const Color(0xFFF64E29);
  static Color get semanticErrorLightColor => const Color(0xFFFFEEDE);
  static Color get semanticSuccessColor => const Color(0xFF21A957);
  static Color get semanticWarningColor => const Color(0xFFC7981F);
  static Color get semanticWarningLightColor => const Color(0xFFFFF9D9);
  static Color get semanticSuccessLightColor => const Color(0xFFEAFAF1);
  static Color get semanticDisabled => const Color(0xFFBEC0CB);
  static Color get barrierColor => const Color(0xFF1E1A34).withOpacity(0.9);
  static Color get inputColor => const Color(0xFF120F23);

  static ThemeData get lightTheme => ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme(
          primary: primaryColor,
          brightness: Brightness.light,
          onPrimary: Colors.white,
          secondary: accentColor,
          onSecondary: Colors.white,
          error: semanticErrorColor,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        errorColor: semanticErrorColor,
        backgroundColor: neutralsDarkerColor,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: neutralsDarkerColor,
              ),
              headline2: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: neutralsDarkerColor,
              ),
              headline3: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: neutralsDarkerColor,
              ),
              headline4: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: neutralsDarkerColor,
              ),
              headline5: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: neutralsDarkerColor,
              ),
              headline6: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: neutralsDarkerColor,
              ),
              subtitle1: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: neutralsDarkerColor,
              ),
              subtitle2: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: neutralsDarkerColor,
              ),
              bodyText1: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: neutralsDarkColor,
              ),
              bodyText2: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: neutralsDarkColor,
              ),
              caption: TextStyle(
                fontSize: 12,
                color: neutralsDarkColor,
              ),
            ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: neutralsLightMediumColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: neutralsDarkerColor,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: semanticErrorColor, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: semanticErrorColor, width: 1.5),
          ),
          labelStyle: MaterialStateTextStyle.resolveWith(
            (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? semanticErrorColor
                  : neutralsDarkColor;
              return TextStyle(
                color: color,
              );
            },
          ),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
            (Set<MaterialState> states) {
              Color color = neutralsDarkColor;
              if (states.contains(MaterialState.error)) {
                color = semanticErrorColor;
              } else if (states.contains(MaterialState.focused)) {
                color = neutralsDarkerColor;
              }
              return TextStyle(color: color);
            },
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: lSize,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(
              color: primaryColor,
              width: 2,
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: lSize,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            foregroundColor: accentColor,
            padding: const EdgeInsets.symmetric(
              horizontal: lSize,
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedItemColor: neutralsDarkColor,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: neutralsDarkColor,
          ),
          type: BottomNavigationBarType.fixed,
        ),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: CustomTheme.neutralsDarkMediumColor,
          labelColor: CustomTheme.neutralsDarkerColor,
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: CustomTheme.neutralsDarkerColor,
                width: 1.5,
              ),
            ),
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          elevation: 0,
        ),
      );
}
