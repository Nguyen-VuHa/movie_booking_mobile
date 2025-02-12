import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/constants/color_constants.dart';
import 'package:movie_booking_mobile/layouts/main_layout.dart';

class CinemaScreen extends StatelessWidget {
  const CinemaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.layoutColor,
      child: Center(
        child: Text(
          'This is cinema screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
