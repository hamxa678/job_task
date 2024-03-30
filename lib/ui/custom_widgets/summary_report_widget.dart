import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryReportWidget extends StatelessWidget {
  final String value;
  final String unit;
  final String iconPath;
  final String title;
  final Color valueColor;

  const SummaryReportWidget.running({
    super.key,
    this.value = '2,846',
    this.unit = ' km',
    this.iconPath = 'assets/running_icon.png',
    this.title = 'Running',
    this.valueColor = const Color(0xff6763FF),
  });

  const SummaryReportWidget.swimming({
    super.key,
    this.value = '10:45',
    this.unit = ' Hrs',
    this.iconPath = 'assets/swimming_icon.png',
    this.title = 'Swimming',
    this.valueColor = const Color(0xffFF8B00),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      padding: EdgeInsets.all(30.h),
      decoration: BoxDecoration(
        color: const Color(0xff2B303D),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      fontSize: 54.sp,
                      color: valueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextSpan(
                  text: ' $unit',
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      fontSize: 40.sp,
                      color: valueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          12.verticalSpace,
          Row(
            children: [
              Image.asset(
                iconPath,
                height: 30.h,
                color: Colors.white,
              ),
              8.horizontalSpace,
              Text(
                title,
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    fontSize: 26.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              90.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
