import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF27DF2D);
  static const Color layoutColor = Color(0xFF121825);
  static const Color secondColor = Color(0xFF262C37);
  static const Color infoColor = Color(0xFF55ACEE);
  static const Color successColor = Color(0xFF219653);
  static const Color warningColor = Color(0xFFFFA70B);
  static const Color errorColor = Color(0xFFE4405F);

  // Gradient example
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1A73E8), Color(0xFF4285F4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
