import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/components/MovieSlider/movie_item.dart';
import 'package:movie_booking_mobile/models/movie.dart';

class MovieSlider extends StatelessWidget {
  final List<MovieDetail> movies; // Danh sách phim
  final bool comming_soon;

  const MovieSlider({
    super.key,
    required this.movies,
    this.comming_soon = false,
  });
  
  @override
  Widget build(BuildContext context) {
    bool hasMultipleItems = movies.length > 1;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 300, // Chiều cao của banner
          autoPlay: hasMultipleItems, // Tự động trượt
          autoPlayInterval:
              Duration(seconds: 4), // Khoảng thời gian giữa mỗi slide
          enlargeCenterPage: hasMultipleItems, // Hiệu ứng phóng to ảnh trung tâm
          viewportFraction: 0.5, // Tỷ lệ hiển thị trên màn hình
          aspectRatio: 1, // Tỷ lệ khung hình
          autoPlayCurve: Curves.decelerate,
          enableInfiniteScroll: hasMultipleItems,
        ),
        items: movies.map((movie) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(6), // Bo góc ảnh
            child: MovieItem(movie: movie, comming_soon: comming_soon),
          );
        }).toList(),
      ),
    );
  }
}
