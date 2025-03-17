import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/components/Common/button.dart';
import 'package:movie_booking_mobile/components/Common/lazy_load_image.dart';
import 'package:movie_booking_mobile/components/Common/typography_text.dart';
import 'package:movie_booking_mobile/components/Modals/trailer_modal.dart';
import 'package:movie_booking_mobile/constants/color_constants.dart';
import 'package:movie_booking_mobile/models/movie.dart';

class MovieItem extends StatelessWidget {
  final MovieDetail movie;
  final bool comming_soon;

  const MovieItem({
    super.key,
    required this.movie,
    this.comming_soon = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            // Ảnh nền
            LazyLoadImage(
              imageUrl: movie.poster,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),

            // Hiệu ứng gradient mờ từ dưới lên
            Positioned(
              bottom: 0,
              left: 0,
              width: constraints.maxWidth, // Lấy width từ LayoutBuilder
              height: 120,
              child: Container(
                width: constraints.maxWidth,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors.secondColor.withValues(alpha: 1), // Đậm ở dưới
                      AppColors.secondColor
                          .withValues(alpha: 0.5), // Trong suốt ở trên
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TypographyText(
                      movie.title,
                      color: AppColors.warningColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        if(!comming_soon)
                          Expanded(
                            child: Button(
                              text: 'Đặt vé',
                              backgroundColor: AppColors.warningColor,
                              onPressed: () => {},
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        
                        Expanded(
                          child: Button(
                            text: 'Trailer',
                            backgroundColor: AppColors.errorColor,
                            fontSize: 10,
                            onPressed: () => {
                              showDialog(
                                context: context,
                                builder: (context) => TrailerModal(
                                    videoUrl:
                                        "https://www.youtube.com/watch?v=" + movie.trailerId),
                              )
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
