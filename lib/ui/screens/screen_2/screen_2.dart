import 'package:demo_app/core/models/body/chart_data_body.dart';
import 'package:demo_app/ui/custom_widgets/stats_card.dart';
import 'package:demo_app/ui/custom_widgets/summary_report_widget.dart';
import 'package:demo_app/ui/screens/screen_2/screen2_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Screen2ViewModel(),
      child: Consumer<Screen2ViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          backgroundColor: const Color(0xff141927),
          body: DefaultTabController(
            length: 4,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  80.verticalSpace,

                  ///
                  /// Header
                  ///
                  _header(),
                  40.verticalSpace,

                  ///
                  /// Week Days
                  ///
                  _weekDays(viewModel),
                  30.verticalSpace,

                  ///
                  /// Statistics Cards
                  ///
                  _statsCards(),
                  35.verticalSpace,

                  ///
                  /// Reports summary.
                  ///
                  _summaryReport(),
                  32.verticalSpace,

                  ///
                  /// Chart Section
                  ///
                  _chartSection(viewModel)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _header() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Report',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Statistics',
                style: GoogleFonts.mulish(
                  color: Colors.white,
                  fontSize: 44.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ClipOval(
            child: Image.asset(
              'assets/profile_pic.png',
              fit: BoxFit.cover,
              height: 65.h,
              width: 65.h,
            ),
          ),
        ],
      ),
    );
  }

  _weekDays(Screen2ViewModel viewModel) {
    return WeeklyDatePicker(
      selectedDay: viewModel.selectedDate,
      changeDay: viewModel.changeDay,
      enableWeeknumberText: false,
      weeknumberTextColor: Colors.white,
      backgroundColor: const Color(0xff141927),
      weekdayTextColor: Colors.white,
      digitsColor: Colors.white,
      selectedDigitBackgroundColor: const Color(0xffFF8B00),
      weekdays: viewModel.weekDays,
      daysInWeek: 7,
    );
  }

  _statsCards() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const StatsCard.pageViews(value: '1,26,435', title: 'PAGE VIEWS'),
          30.horizontalSpace,
          const StatsCard.bouncingRate(value: '26.84%', title: 'BOUNCING RATE'),
        ],
      ),
    );
  }

  _summaryReport() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Summary Report',
            style: GoogleFonts.mulish(
              textStyle: TextStyle(
                fontSize: 34.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          30.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SummaryReportWidget.running(),
              30.horizontalSpace,
              const SummaryReportWidget.swimming(),
            ],
          ),
        ],
      ),
    );
  }

  _chartSection(Screen2ViewModel viewModel) {
    return Column(
      children: [
        ///
        /// Tabs
        ///
        TabBar(
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          isScrollable: false,
          labelColor: const Color(0xffF52C56),
          labelStyle: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          unselectedLabelStyle: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          unselectedLabelColor: Colors.white,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Color(0xffF52C56),
            ),
          ),
          dividerColor: Colors.transparent,
          tabs: const [
            Text('01 Month'),
            Text('03 Months'),
            Text('06 Months'),
            Text('01 Year')
          ],
        ),

        ///
        /// Chart
        ///
        SizedBox(
          height: 500.h,
          child: SfCartesianChart(
            primaryXAxis: xAxis,
            primaryYAxis: yAxis,
            plotAreaBorderWidth: 0,
            series: <CartesianSeries>[
              LineSeries<LineChartData, DateTime>(
                color: const Color(0xffF52C56),
                dataSource: viewModel.chartData1,
                xValueMapper: (LineChartData data, _) => data.x,
                yValueMapper: (LineChartData data, _) => data.y,
              ),
              LineSeries<LineChartData, DateTime>(
                color: const Color(0xffFF8B00),
                dataSource: viewModel.chartData2,
                xValueMapper: (LineChartData data, _) => data.x,
                yValueMapper: (LineChartData data, _) => data.y,
              ),
            ],
          ),
        ),
      ],
    );
  }

  get xAxis => DateTimeAxis(
        majorGridLines: MajorGridLines(
          color: const Color(0xff2B303D).withOpacity(0.3),
        ),
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
        ),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        intervalType: DateTimeIntervalType.months,
        interval: 1,
        majorTickLines: const MajorTickLines(size: 0),
        axisLine: const AxisLine(width: 0),
      );

  get yAxis => NumericAxis(
        labelStyle: TextStyle(
          color: Colors.transparent,
          fontSize: 0.sp,
        ),
        axisLine: const AxisLine(
          width: 0,
          color: Colors.transparent,
        ),
        majorGridLines: MajorGridLines(
          color: const Color(0xff2B303D).withOpacity(0.3),
        ),
        majorTickLines: const MajorTickLines(size: 0),
      );
}
