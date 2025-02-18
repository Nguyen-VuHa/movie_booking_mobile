import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/components/Common/typography_text.dart';
import 'package:movie_booking_mobile/components/MovieSlider/movie_slider.dart';
import 'package:movie_booking_mobile/providers/movie_model.dart';
import 'package:provider/provider.dart';

class MovieCommingSoon extends StatelessWidget {
  const MovieCommingSoon({super.key});

  @override
  Widget build(BuildContext context) {
     final movie = context.watch<MovieModel>();

     return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TypographyText('Phim Sắp Chiếu', fontSize: 25, fontWeight: FontWeight.w600,),
        SizedBox(height: 10),
        MovieSlider(movies: movie.movie_comming_soon, comming_soon: true,),
      ],
    );
  }
}
