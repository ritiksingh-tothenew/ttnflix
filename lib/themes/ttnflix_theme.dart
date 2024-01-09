import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ttnflix/themes/ttnflix_colors.dart';
import 'package:ttnflix/themes/ttnflix_sizes.dart';
import 'package:ttnflix/themes/ttnflix_textstyles.dart';

class TtnFlixTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scrollbarTheme: const ScrollbarThemeData()
        .copyWith(thumbColor: const MaterialStatePropertyAll(Colors.black)),
    primaryColor: TTnFlixColors.primaryColor.lightColor,
    canvasColor: TTnFlixColors.canvasColor.lightColor,
    dividerColor: TTnFlixColors.dividerColor.lightColor,
    disabledColor: TTnFlixColors.groundColor.lightColor?.withOpacity(0.345),
    shadowColor: TTnFlixColors.groundColor.lightColor?.withOpacity(0.33),
    dividerTheme: _getDividerThemeData(Brightness.light),
    inputDecorationTheme: _getInputDecorationTheme(Brightness.light),
    fontFamily: 'Inter',
    splashColor: Platform.isIOS ? Colors.transparent : null,
    appBarTheme: _appBarThemeData(Brightness.light),
    textTheme: TtnFlixTextStyles.defaultTextTheme.apply(
        bodyColor: TTnFlixColors.onPrimary.lightColor,
        displayColor: TTnFlixColors.onPrimary.lightColor),
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: TTnFlixColors.primaryColor.darkColor,
      canvasColor: TTnFlixColors.canvasColor.darkColor,
      dividerColor: TTnFlixColors.dividerColor.darkColor,
      disabledColor: TTnFlixColors.groundColor.darkColor?.withOpacity(0.345),
      shadowColor: TTnFlixColors.groundColor.darkColor?.withOpacity(0.33),
      dividerTheme: _getDividerThemeData(Brightness.dark),
      inputDecorationTheme: _getInputDecorationTheme(Brightness.dark),
      appBarTheme: _appBarThemeData(Brightness.dark),
      fontFamily: 'Inter',
      textTheme: TtnFlixTextStyles.defaultTextTheme.apply(
          bodyColor: TTnFlixColors.informGreyColor.darkColor,
          displayColor: TTnFlixColors.informGreyColor.darkColor),
      bottomSheetTheme: _bottomSheetThemeData(Brightness.dark),
      tabBarTheme: _getDefaultTabBarTheme(Brightness.dark),
      tooltipTheme: _getTooltipThemeData(Brightness.dark),
      colorScheme: _getAppColorScheme(Brightness.dark)
          .copyWith(background: TTnFlixColors.backgroundColor.darkColor));

  static InputDecorationTheme _getInputDecorationTheme(Brightness brightness) {
    final secondaryTextColor = TTnFlixColors.tabSecondaryTextColor[brightness];

    final floatingLabelStyle = TtnFlixTextStyles.getBody1SemiBold()
        .copyWith(color: secondaryTextColor);
    final helperStyle = TtnFlixTextStyles.defaultTextTheme.bodySmall!
        .copyWith(color: secondaryTextColor, height: 0.8);
    final errorColor = TTnFlixColors.onErrorColor[brightness];
    final errorStyle = TtnFlixTextStyles.defaultTextTheme.bodySmall!
        .copyWith(color: errorColor, height: 0.8);

    final enabledBorderColor = TTnFlixColors.dividerColor[brightness];
    final focusedBorderColor = TTnFlixColors.primaryColor[brightness];
    final disabledBorderColor =
        TTnFlixColors.onDisabledBoundaryColor[brightness];

    InputBorder border({Color? color}) {
      return OutlineInputBorder(
        borderSide: BorderSide(color: color ?? Colors.white),
        borderRadius:
            const BorderRadius.all(Radius.circular(TtnFlixSize.size16)),
      );
    }

    return InputDecorationTheme(
      border: border(),
      enabledBorder: border(color: enabledBorderColor),
      focusedBorder: border(color: focusedBorderColor),
      disabledBorder: border(color: disabledBorderColor),
      errorBorder: border(color: errorColor),
      helperStyle: helperStyle,
      errorStyle: errorStyle,
      floatingLabelStyle: floatingLabelStyle,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(TtnFlixSize.size16),
    );
  }

  static DividerThemeData _getDividerThemeData(Brightness brightness) {
    return DividerThemeData(
      color: TTnFlixColors.dividerColor[brightness],
      thickness: 0.5,
      space: 0.5,
      indent: 0,
      endIndent: 0,
    );
  }

  static AppBarTheme _appBarThemeData(Brightness brightness) {
    return AppBarTheme(
        backgroundColor: TTnFlixColors.canvasColor[brightness],
        iconTheme: IconThemeData(color: TTnFlixColors.primaryColor[brightness]),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: brightness,
            statusBarIconBrightness: brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
            statusBarColor: Colors.transparent));
  }

  static ColorScheme _getAppColorScheme(Brightness brightness) {
    return ColorScheme(
        primary: TTnFlixColors.primaryColor[brightness]!,
        secondary: TTnFlixColors.secondaryColor[brightness]!,
        surface: TTnFlixColors.canvasColor[brightness]!,
        background: TTnFlixColors.backgroundColor[brightness]!,
        error: TTnFlixColors.errorColor[brightness]!,
        onPrimary: TTnFlixColors.onPrimary[brightness]!,
        onSecondary: TTnFlixColors.onSecondary[brightness]!,
        onSurface: TTnFlixColors.onSurface[brightness]!,
        onBackground: TTnFlixColors.onBackgroundColor[brightness]!,
        onError: TTnFlixColors.onErrorColor[brightness]!,
        brightness: brightness);
  }

  static BottomSheetThemeData _bottomSheetThemeData(Brightness brightness) =>
      BottomSheetThemeData(
          modalBackgroundColor:
              TTnFlixColors.groundColor[brightness]!.withOpacity(0.2),
          modalBarrierColor:
              TTnFlixColors.groundColor[brightness]?.withOpacity(0.2));

  static TabBarTheme _getDefaultTabBarTheme(Brightness brightness) {
    return TabBarTheme(
        labelColor: TTnFlixColors.informGreyColor[brightness],
        unselectedLabelColor: TTnFlixColors.tabSecondaryTextColor[brightness],
        unselectedLabelStyle: TtnFlixTextStyles.defaultTextTheme.titleSmall,
        labelStyle: TtnFlixTextStyles.defaultTextTheme.titleSmall);
  }

  static TooltipThemeData _getTooltipThemeData(Brightness brightness) {
    return const TooltipThemeData(showDuration: Duration(minutes: 10));
  }
}
