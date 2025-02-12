import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/constants/color_constants.dart';

class ButtonNavBar extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final bool isActive;
  final double buttonWidth;

  const ButtonNavBar({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.buttonWidth,
  }) : super(key: key);

  @override
  _ButtonNavBarState createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<ButtonNavBar> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Nút bấm chính
        InkWell(
          onTap: widget.onPressed,
          onHighlightChanged: (isHighlighted) {
            setState(() {
              _isPressed = isHighlighted; // Hiển thị splash khi nhấn
            });
          },
          splashColor: Colors.transparent, // Bỏ splash mặc định
          highlightColor: Colors.transparent, // Bỏ highlight mặc định
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon,
                    color:
                        widget.isActive ? AppColors.primaryColor : Colors.grey,
                    size: 26),
                const SizedBox(height: 5),
                Text(
                  widget.label,
                  style: TextStyle(
                      color: widget.isActive
                          ? AppColors.primaryColor
                          : Colors.grey,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ),

        // Layer splash gradient khi nhấn
        if (_isPressed)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.successColor
                        .withValues(alpha: (1).toDouble()), // Màu đậm ở trên
                    AppColors.successColor.withValues(
                        alpha: (0.3).toDouble()), // Màu nhạt dần xuống
                    Colors.transparent, // Hoàn toàn biến mất ở đáy
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
