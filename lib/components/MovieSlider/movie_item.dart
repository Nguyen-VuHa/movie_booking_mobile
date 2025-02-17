import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/components/Common/button.dart';
import 'package:movie_booking_mobile/components/Common/lazy_load_image.dart';
import 'package:movie_booking_mobile/components/Common/typography_text.dart';
import 'package:movie_booking_mobile/components/Modals/trailer_modal.dart';
import 'package:movie_booking_mobile/constants/color_constants.dart';

class MovieItem extends StatelessWidget {
  final String posterURL;

  const MovieItem({
    super.key,
    required this.posterURL,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            // Ảnh nền
            LazyLoadImage(
              imageUrl: posterURL,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),

            // Hiệu ứng gradient mờ từ dưới lên
            Positioned(
              bottom: 0,
              left: 0,
              width: constraints.maxWidth, // Lấy width từ LayoutBuilder
              height: 100,
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
                      'Nhà Bà Nữ',
                      color: AppColors.warningColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(children: [
                      Button(
                        text: 'Đặt vé',
                        backgroundColor: AppColors.warningColor,
                        onPressed: () => {},
                      ),
                      SizedBox(width: 5,),
                      Button(
                        text: 'Trailer',
                        backgroundColor: AppColors.errorColor,
                        onPressed: () => {
                          showDialog(
                              context: context,
                              builder: (context) => TrailerModal(videoUrl: "https://www.youtube.com/watch?v=PnlS4B0GPOA"),
                            )
                        },
                      ),
                    ],),
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
