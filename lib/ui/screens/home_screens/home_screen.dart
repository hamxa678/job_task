import 'package:demo_app/ui/screens/home_screens/home_screen_view_model.dart';
import 'package:demo_app/ui/custom_widgets/spline_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenViewModel(),
      child: Consumer<HomeScreenViewModel>(
        builder: (context, model, child) => DefaultTabController(
          initialIndex: model.initialSelectedTab,
          length: 3,
          child: Scaffold(
            backgroundColor: const Color(0xff000000).withOpacity(0.01),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(29.w, 97.h, 29.w, 0),
                    child: Column(
                      children: [
                        _tabbar(),
                        44.verticalSpace,
                        SizedBox(
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              Text('Overview', style: GoogleFonts.mulish(textStyle: TextStyle(color: Colors.white, fontSize: 34.sp, fontWeight: FontWeight.bold))),
                              const Spacer(),
                              TabBar(
                                labelPadding: EdgeInsets.only(right:  0,left: 40.w),
                                    isScrollable: true,
                                      labelColor: const Color(0xffF52C56),
                                      labelStyle: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.normal)),
                                      unselectedLabelStyle: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.normal)),
                                      unselectedLabelColor: Colors.white,
                                      indicator: const UnderlineTabIndicator(
                                          borderSide: BorderSide(
                                        color:  Color(0xffF52C56),
                                      )),
                                    dividerColor: Colors.transparent,
                                    tabs: model.duration.map((duration) => Text(duration)).toList()
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  39.verticalSpace,
                  SizedBox(
                    height: 169.h,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 30.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: model.dashboardData.overview!.length,
                      itemBuilder: (context, index)=>Container(
                        margin: EdgeInsets.only(right: 30.w),
                        padding: EdgeInsets.fromLTRB(37.w, 11.h, 37.w, 36.h),
                        // width: 270.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.r)),
                          color: Colors.white.withOpacity(0.1)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(model.dashboardData.overview![index].value.toString(), style: GoogleFonts.mulish(textStyle: TextStyle(fontSize: 60.sp, color: const Color(0xffFF8B00), fontWeight: FontWeight.bold)),),
                            Text(model.dashboardData.overview![index].title!, style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 25.sp, color: Colors.white, fontWeight: FontWeight.bold)),)
                          
                          ],
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 29.w),
              
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        60.verticalSpace,
                        Text('Daily Activity', style: GoogleFonts.mulish(textStyle: TextStyle(fontSize: 34.sp, color: Colors.white, fontWeight: FontWeight.bold)),),
                        43.verticalSpace,
                        Text('Steps', style: GoogleFonts.mulish(textStyle: TextStyle(fontSize: 25.sp, color: Colors.white, fontWeight: FontWeight.bold)),),
                        2.5.verticalSpace,
                        Text(model.dashboardData.dailyactivity!.noofsteps.toString(), style: GoogleFonts.mulish(textStyle: TextStyle(fontSize: 80.sp, color: Colors.white, fontWeight: FontWeight.bold)),),
                        70.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: model.dashboardData.dailyactivity!.moredata!.map((data) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                        Text(data.title!, style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold)),),
                        RichText(text: TextSpan(
                          text: '${data.value.toString()} ',
                          style: GoogleFonts.mulish(textStyle: TextStyle(fontSize: 54.sp, color: Colors.white, fontWeight: FontWeight.bold)),
                          children: <TextSpan>[
                            TextSpan(text: 'km', style: GoogleFonts.mulish(textStyle: TextStyle(fontSize: 36.sp, color: Colors.white, fontWeight: FontWeight.bold)),)
                          ]
                          )),
                          ],),
                        ).toList(),
                        ),
                        70.verticalSpace,
                      ],
                    ),
                  ),
                  SplineChart(chartData1: model.chartData1, chartData2: model.chartData2, firstChartColor: const Color(0xffF52C56), secondChartColor: const Color(0xffFF8B00),)
                ],
              ),
            )
          ),
        ),
      ),
    );
  }

  Widget _tabbar() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dashboard', style: GoogleFonts.mulish(textStyle: TextStyle(color: Colors.white, fontSize: 44.sp, fontWeight: FontWeight.bold))),
              12.verticalSpace,
              RichText(text: TextSpan(
                text: 'Good Morning. Analytic your ',
                style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, fontSize: 22.sp)),
                children: const <TextSpan>[
                  TextSpan(text: 'Game!', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFF8B00)))
                ]
                )),
              // Text('Good Morning. Analytic your Game!', style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, fontSize: 22.sp))),
            ],
          ),
          GestureDetector(
            onTap: ()=>{},
            child: SizedBox(
              child: SvgPicture.asset('images/icons/Object.svg', 
              )),
          ),
        ],
      );
  }
}



