import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/components/BottomNavBar/bottom_navbar.dart';
import 'package:movie_booking_mobile/constants/color_constants.dart';
import 'package:movie_booking_mobile/providers/global_model.dart';
import 'package:movie_booking_mobile/screens/cinema_screen.dart';
import 'package:movie_booking_mobile/screens/Home/home_screen.dart';
import 'package:movie_booking_mobile/screens/showtime_screen.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final List<Widget> _pages = [
    HomeScreen(),
    ShowtimeScreen(),
    CinemaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final global = context.watch<GlobalModel>();
    return Scaffold(
      body: Container(
        color: AppColors.layoutColor,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 250),
          transitionBuilder: (child, animation) {
            // Xác định hướng trượt dựa vào _previousIndex và _selectedIndex
            final slideOffset = (global.previousIndex < global.indexStack)
                ? const Offset(1.0, 0.0) // Trượt từ phải sang trái
                : const Offset(-1.0, 0.0); // Trượt từ trái sang phải

            return SlideTransition(
              position: Tween<Offset>(begin: slideOffset, end: Offset.zero)
                  .animate(animation),
              child: child,
            );
          },
          child: _pages[global.indexStack],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
