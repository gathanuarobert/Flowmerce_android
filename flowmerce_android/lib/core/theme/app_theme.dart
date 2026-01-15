import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFFF5C00);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    // ---- PRIMARY COLORS ----
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFFF9FAFB),

    // ---- APP BAR THEME ----
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

    // ---- DRAWER THEME ----
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),

    // ---- LIST TILE THEME (Drawer items) ----
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black87,
      textColor: Colors.black87,
    ),
  );
}
