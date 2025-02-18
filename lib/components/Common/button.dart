import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/constants/color_constants.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final IconData? icon;
  final double fontSize;

  const Button({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = AppColors.warningColor,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.icon,
    this.fontSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return backgroundColor.withValues(alpha: 0.7); // Khi bấm vào
              }
              return backgroundColor; // Màu mặc định
            },
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor, size: fontSize + 2),
              SizedBox(width: 4),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}