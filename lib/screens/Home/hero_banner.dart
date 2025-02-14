import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/components/Common/lazy_load_image.dart';

class HeroBanner extends StatelessWidget {
  final List<String> bannerImages = [
    'https://bhdstar.vn/wp-content/uploads/2025/02/BannerT2-01.jpg',
    'https://bhdstar.vn/wp-content/uploads/2025/02/nu-hon-bac-ty-web-app-lcd-2.jpg',
    'https://bhdstar.vn/wp-content/uploads/2024/07/z5613022018407_76fddb90fa1896ff5317324ca73f97b8.jpg',
    'https://bhdstar.vn/wp-content/uploads/2025/02/referenceSchemeHeadOfficeallowPlaceHoldertrueheight1069ldapp.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 230, // Chiều cao của banner
          autoPlay: true, // Tự động trượt
          autoPlayInterval:
              Duration(seconds: 5), // Khoảng thời gian giữa mỗi slide
          enlargeCenterPage: true, // Hiệu ứng phóng to ảnh trung tâm
          viewportFraction: 0.95, // Tỷ lệ hiển thị trên màn hình
          aspectRatio: 16 / 9, // Tỷ lệ khung hình
        ),
        items: bannerImages.map((imageUrl) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(6), // Bo góc ảnh
            child: LazyLoadImage(
              imageUrl: imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
      ),
    );
  }
}
