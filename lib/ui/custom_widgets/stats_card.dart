import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsCard extends StatelessWidget {
  final String value;
  final String title;
  final Color backgroundColor;
  final String imagePath;

  const StatsCard.pageViews({
    super.key,
    required this.value,
    required this.title,
    this.backgroundColor = const Color(0xff6763FF),
    this.imagePath = 'assets/curved_line.png',
  });

  const StatsCard.bouncingRate({
    super.key,
    required this.value,
    required this.title,
    this.backgroundColor = const Color(0xffE62E4D),
    this.imagePath = 'assets/pointed_line.png',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: GoogleFonts.mulish(
              textStyle: TextStyle(
                fontSize: 46.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          12.verticalSpace,
          Text(
            title,
            style: GoogleFonts.mulish(
              textStyle: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image.asset(
            imagePath,
            height: 41,
          ),
        ],
      ),
    );
  }
}
