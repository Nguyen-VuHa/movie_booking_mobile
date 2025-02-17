import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/components/Modals/trailer_modal.dart';
import 'package:movie_booking_mobile/constants/color_constants.dart';
import 'package:movie_booking_mobile/screens/Home/hero_banner.dart';
import 'package:movie_booking_mobile/screens/Home/movie_comming_soon.dart';
import 'package:movie_booking_mobile/screens/Home/movie_now_showing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                kBottomNavigationBarHeight, // Chiều cao tối thiểu bằng màn hình
          ),
          child: Container(
            color: AppColors.layoutColor,
            child: Column(
              children: [
                HeroBanner(),
                SizedBox(height: 20),
                MovieNowShowing(),
                SizedBox(height: 20),
                MovieCommingSoon(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
