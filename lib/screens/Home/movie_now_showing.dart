import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/components/Common/typography_text.dart';
import 'package:movie_booking_mobile/components/MovieSlider/movie_slider.dart';

class MovieNowShowing extends StatelessWidget {
  const MovieNowShowing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TypographyText('Phim Đang Chiếu', fontSize: 25, fontWeight: FontWeight.w600,),
        SizedBox(height: 10),
        MovieSlider(),
      ],
    );
  }
}
