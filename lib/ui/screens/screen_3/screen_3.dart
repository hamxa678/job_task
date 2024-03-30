import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'screen_3_view_model.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Screen3ViewModel(),
      child: Consumer<Screen3ViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          backgroundColor: const Color(0xff141927),
          body: DefaultTabController(
      initialIndex: 0,
      length: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(28.w, 109.h, 28.w, 28.h),
                child: Column(
                  children: [
                    _appBar(context),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      child: TabBar(
                        padding: EdgeInsets.zero,
                                labelPadding: EdgeInsets.zero,
                                    isScrollable: false,
                                      labelColor: const Color(0xffF52C56),
                                      labelStyle: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.normal)),
                                      unselectedLabelStyle: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.normal)),
                                      unselectedLabelColor: Colors.white,
                                      indicator: const UnderlineTabIndicator(
                                          borderSide: BorderSide(
                                        color:  Color(0xffF52C56),
                                      )),
                                    dividerColor: Colors.transparent,
                                    tabs: const  [
                                    Text('01 Month'),
                                    Text('03 Months'),
                                    Text('06 Months'),
                                    Text('01 Year')
                                                 ]),
                    ),
                    // _barDurationtabs(viewModel),
                    const BarChartSample6(),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _pointsWidgets("Total points", "2.354"),
                        _pointsWidgets("Avg. Points per Run", "98"),
                      ],
                    ),
                
                    //
                    Container(
                      margin: EdgeInsets.only(top: 40.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50.w, vertical: 32.h),
                      decoration: BoxDecoration(
                        color: const Color(0xff2B303D),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Game Detail',
                                style: GoogleFonts.mulish(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: const Color(0xffFF8B00),
                                    size: 12.sp,
                                  ),
                                  Text(
                                    '  Sprint',
                                    style: GoogleFonts.mulish(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                
                          //rich text
                          textMessage(),
                
                          SizedBox(
                              height: 300.h,
                              child: SfCartesianChart(
                                  primaryXAxis: DateTimeAxis(
                                    majorGridLines: const MajorGridLines(width: 0),
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                    ),
                                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                                    intervalType: DateTimeIntervalType.days,
                                    interval: 1,
                                    majorTickLines: const MajorTickLines(size: 0),
                                    axisLine: const AxisLine(width: 0),
                                  ),
                                  primaryYAxis: NumericAxis(
                                    labelStyle: TextStyle(
                                      color: Colors.transparent,
                                      fontSize: 0.sp,
                                    ),
                                    axisLine: const AxisLine(
                                      width: 0,
                                      color: Colors.transparent,
                                    ),
                
                                    majorGridLines: const MajorGridLines(
                                        color: Colors.transparent),
                
                                    majorTickLines: const MajorTickLines(
                                      size: 0,
                                      color: Color(0xffF52C56),
                                    ),
                                    isVisible: true,
                                    
                                    placeLabelsNearAxisLine: false,
                                  ),
                                  plotAreaBorderWidth: 0,
                                  series: <CartesianSeries>[
                                    LineSeries<SalesData, DateTime>(
                                      color: const Color(0xffF52C56),
                                        dataSource: viewModel.dataSource,
                                        xValueMapper: (SalesData sales, _) =>
                                            sales.xValue,
                                        yValueMapper: (SalesData sales, _) =>
                                            sales.sales)
                                  ])),
                
                          _divider(),
                
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  //runner icon
                                  Icon(
                                    Icons.directions_run,
                                    color: Colors.white,
                                    size: 30.sp,
                                  ),
                                  Text("Max Speed",
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                              Column(
                                children: [
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: '18./ ',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'km/h',
                                          style: GoogleFonts.roboto(
                                            color: const Color(0xffFF8B00),
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text("Personal Speed",
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _divider() {
    return Container(
      height: 1.h,
      color: Colors.grey.shade800,
      margin: EdgeInsets.symmetric(vertical: 20.h),
      width: 350.w,
    );
  }

  RichText textMessage() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'You were',
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontSize: 25.sp,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: ' 48%',
            style: GoogleFonts.roboto(
              color: const Color(0xffF42C56),
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'slower than Usaully Today',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Column _pointsWidgets(String title, String value) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: GoogleFonts.roboto(
                height: 1,
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
              )),
          Text(value,
              style: GoogleFonts.mulish(
                color: Colors.white,
                fontSize: 54.sp,
                height: 1,
                fontWeight: FontWeight.bold,
              )),
        ]);
  }

  Widget _appBar(BuildContext context) {
    return  Row(
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
              SizedBox(height: 5.h),
              Text(
                'Analytics Reports',
                style: GoogleFonts.mulish(
                  color: Colors.white,
                  fontSize: 44.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          IconButton(
          onPressed: () {
            showModalBottomSheet(context: context, builder: (BuildContext context)=>Container(
              // height: (1624-450).h,
              // height: 1624.h,
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
              color: const Color(0xff141927),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('# 12 Running', style: GoogleFonts.roboto(color: Colors.white,fontSize: 24.sp),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Lurch Schpellchek', style: GoogleFonts.mulish(color: Colors.white,fontSize: 48.sp, fontWeight: FontWeight.bold),),
                          Image.asset(
                            'assets/BGheart.png',
                            height: 59.h,
                            width: 59.w,
                            fit: BoxFit.scaleDown
                          ),
                        ],
                      ),
                      24.verticalSpace,
                      Row(children: [
                        Image.asset(
                            'assets/USA.png',
                            height: 36.h,
                            width: 54.w,
                            fit: BoxFit.scaleDown,
                          ),
                          19.horizontalSpace,
                          Text('USA', style: GoogleFonts.roboto(color: Colors.white,fontSize: 24.sp),),
                  
                      ],),
                      40.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [1,2,3].map((e) => Container(
                          height: 130.h,
                          width: 210.w,
                          decoration: BoxDecoration(
                            color: const Color(0xff000000).withOpacity(0.1),
                            borderRadius: BorderRadius.all(Radius.circular(25.r))
                          ),
                          child: Column(children: [
                            Text('25', style: GoogleFonts.mulish(color: const Color(0xffFF8B00),fontSize: 42.sp, fontWeight: FontWeight.bold),),
                            16.verticalSpace,
                            Text('Age', style: GoogleFonts.roboto(color: Colors.white,fontSize: 24.sp),),
                          ],),
                        ),).toList()
                      ),
                      59.verticalSpace,
                      Text('About Me', style: GoogleFonts.mulish(color: const Color(0xffFFffff),fontSize: 34.sp, fontWeight: FontWeight.bold),),
                      6.verticalSpace,
                      Text('The argument in favor of using filler text goes something like this: If you use real content in the design process, anytime you reach a review point you’ll end up reviewing and negotiating the content', style: GoogleFonts.roboto(color: Colors.white,fontSize: 22.sp),),
                      56.verticalSpace,
                      Text('Player Stats', style: GoogleFonts.mulish(color: const Color(0xffFFffff),fontSize: 34.sp, fontWeight: FontWeight.bold),),
                      36.verticalSpace,
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context,index)=> Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Goal Achieved Record', style: GoogleFonts.roboto(color: Colors.white,fontSize: 22.sp, fontWeight: FontWeight.bold),),
                                Text('145', style: GoogleFonts.mulish(color: const Color(0xffFF8B00),fontSize: 28.sp, fontWeight: FontWeight.bold),),

                              
                              ],
                            ),
                            Divider(thickness: 1.h,height: 72.h, color: Colors.white.withOpacity(0.1),)
                          
                        ],
                      ))
                    ],
                  ),
                ),
            ));
          },
          icon: ClipOval(
            child: Image.asset(
              'assets/profile_pic.png',
              fit: BoxFit.cover,
              // scale: 2.5,
              height: 65.h,
              width: 65.h,
            ),
          ),
        ),
        ],
      );
  }

  Row _barDurationtabs(Screen3ViewModel viewModel) {
    return Row(
      children: [
        CustomTextButton(
          onPressed: () {
            viewModel.selectTabOfBarChartMethod('01 Month');
          },
          title: '01 Month',
          isSelected: viewModel.isItSelected('01 Month'),
        ),
        CustomTextButton(
          onPressed: () {
            viewModel.selectTabOfBarChartMethod('03 Months');
          },
          title: '03 Months',
          isSelected: viewModel.isItSelected('03 Months'),
        ),
        CustomTextButton(
          onPressed: () {
            viewModel.selectTabOfBarChartMethod('06 Months');
          },
          title: '06 Months',
          isSelected: viewModel.isItSelected('06 Months'),
        ),
        CustomTextButton(
          onPressed: () {
            viewModel.selectTabOfBarChartMethod('1 Year');
          },
          title: '1 Year',
          isSelected: viewModel.isItSelected('1 Year'),
        ),
      ],
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.isSelected,
  });
  final Function()? onPressed;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: GoogleFonts.roboto(
          color: isSelected ? const Color(0xffF42C56) : Colors.white,
          decoration:
              isSelected ? TextDecoration.underline : TextDecoration.none,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class BarChartSample6 extends StatelessWidget {
  const BarChartSample6({super.key});

  final yourPointColor = const Color(0xff5754D7);
  final averagePointColor = const Color(0xffFF8B00);
  final betweenSpace = 0.2;

  BarChartGroupData generateGroupData(
      int x, double pilates, double quickWorkout) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          color: yourPointColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout,
          color: averagePointColor,
          width: 5,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'JAN';
        break;
      case 1:
        text = 'FEB';
        break;
      case 2:
        text = 'MAR';
        break;
      case 3:
        text = 'APR';
        break;
      case 4:
        text = 'MAY';
        break;
      case 5:
        text = 'JUN';
        break;
      case 6:
        text = 'JUL';
        break;
      case 7:
        text = 'AUG';
        break;
      case 8:
        text = 'SEP';
        break;
      case 9:
        text = 'OCT';
        break;
      case 10:
        text = 'NOV';
        break;
      case 11:
        text = 'DEC';
        break;
      default:
        text = '';
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text,
          style: GoogleFonts.roboto(fontSize: 14.sp, color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              lable(yourPointColor, "Your Point"),
              SizedBox(width: 40.w),
              lable(averagePointColor, "Average Point"),
            ],
          ),
          AspectRatio(
            aspectRatio: 2,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitles,
                      reservedSize: 20,
                    ),
                  ),
                ),
                barTouchData: BarTouchData(enabled: true),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                barGroups: [
                  generateGroupData(0, 2, 3),
                  generateGroupData(1, 2, 3),
                  generateGroupData(2, 1.3, 3.1),
                  generateGroupData(3, 3.1, 4),
                  generateGroupData(4, 0.8, 3.3),
                  generateGroupData(5, 2, 5.6),
                  generateGroupData(6, 1.3, 3.2),
                  generateGroupData(7, 2.3, 3.2),
                  generateGroupData(8, 2, 4.8),
                  generateGroupData(9, 1.2, 3.2),
                  generateGroupData(10, 1, 4.8),
                  generateGroupData(11, 2, 4.4),
                ],
                maxY: 9 + (betweenSpace * 2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row lable(Color color, String title) {
    return Row(
      children: [
        Container(
          width: 15.h,
          height: 15.h,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 10.w),
        Text(title,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}

class SalesData {
  SalesData(this.xValue, this.sales);
  final DateTime xValue;
  final double sales;
}
