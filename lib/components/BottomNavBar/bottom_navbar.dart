import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/components/Common/button_navbar.dart';
import 'package:movie_booking_mobile/constants/color_constants.dart';
import 'package:movie_booking_mobile/providers/global_model.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final global = context.watch<GlobalModel>();

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: AppColors.secondColor,
      padding: EdgeInsets.all(0),
      child: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
        // Tính chiều rộng mỗi tab
        double tabWidth = constraints.maxWidth / 4;
        return Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: ButtonNavBar(
                  onPressed: () {
                    global.setPreviousIndex(global.indexStack);
                    global.setIndexStack(0);
                  },
                  label: 'Trang Chủ',
                  icon: Icons.home,
                  isActive: global.indexStack == 0,
                  buttonWidth: 80,
                )),
                Expanded(
                    child: ButtonNavBar(
                  onPressed: () {
                    global.setPreviousIndex(global.indexStack);
                    global.setIndexStack(1);
                  },
                  label: 'Lịch chiếu',
                  icon: Icons.calendar_month,
                  isActive: global.indexStack == 1,
                  buttonWidth: 80,
                )),
                Expanded(
                    child: ButtonNavBar(
                  onPressed: () {
                    global.setPreviousIndex(global.indexStack);
                    global.setIndexStack(2);
                  },
                  label: 'Cụm rạp',
                  icon: Icons.three_g_mobiledata,
                  isActive: global.indexStack == 2,
                  buttonWidth: 80,
                )),
                Expanded(
                    child: ButtonNavBar(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/tai-khoan');
                  },
                  label: 'Tài khoản',
                  icon: Icons.person,
                  isActive: false,
                  buttonWidth: 80,
                )),
              ],
            ),
              // Dấu hiệu slider dưới cùng
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: global.indexStack * tabWidth, // Vị trí theo index
              top: 0,
              child: Container(
                width: tabWidth,
                
                height: 4, // Độ dày của thanh slider
                // color: AppColors.primaryColor, // Màu sắc của slider
                decoration: BoxDecoration(
                  color: AppColors.primaryColor, // Màu sắc của slider
                  borderRadius: BorderRadius.circular(10), // Đây là phần quan trọng để bo góc!
                ),
              ),
            ),

          ],
        );
      })),
    );
  }
}
