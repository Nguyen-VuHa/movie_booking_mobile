
import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/screens/cinema_screen.dart';
import 'package:movie_booking_mobile/screens/Home/home_screen.dart';
import 'package:movie_booking_mobile/screens/showtime_screen.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      AppRoutes.home: (context) => const HomeScreen(),
      AppRoutes.showtime: (context) => const ShowtimeScreen(),
      AppRoutes.cinema: (context) => const CinemaScreen(),
    };
  }
}