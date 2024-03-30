import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'root_screen_view_model.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootScreenViewModel(),
      child: Consumer<RootScreenViewModel>(
        builder: (context, model, child) => WillPopScope(
          onWillPop: () async {
            final status = await Get.dialog(AlertDialog(
              title: const Text('Caution!'),
              content:
                  const Text('Do you really want to close the application?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Get.back(result: true);
                  },
                  child: const Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back(result: false);
                  },
                  child: const Text('No'),
                ),
              ],
            ));

            /// In case user has chosen not to be kept logged in,
            /// he will get logged out of the app on exit.
            // if (status && !locator<AuthService>().isRememberMe) {
            //   await locator<AuthService>().logout();
            // }
            return status;
          },
          child: Scaffold(
            backgroundColor: const Color(0xff141927),
            extendBody: true,
            body: model.allScreen[model.selectedScreen],
            bottomNavigationBar: CircleNavBar(
              activeIndex: model.selectedScreen,
              activeIcons: [
                const Icon(Icons.settings, color: Colors.white),
                Image.asset(
                  'assets/bar_chart_icon.png',
                  fit: BoxFit.scaleDown,
                  scale: 2.5,
                ),
                const Icon(Icons.person, color: Colors.white),
              ],
              inactiveIcons: [
                const Icon(Icons.settings, color: Colors.white),
                Image.asset(
                  'assets/bar_chart_icon.png',
                  fit: BoxFit.scaleDown,
                  scale: 2.5,
                ),
                const Icon(Icons.person, color: Colors.white),
              ],
              color: const Color(0xff2B303D),
              circleColor: const Color(0xffFF0050),
              height: 65,
              circleWidth: 55,
              shadowColor: const Color(0xff141927),

              onTap: model.updatedScreenIndex,
              // tabCurve: ,
              padding: EdgeInsets.only(left: 60.w, right: 60.w, bottom: 40.h),
              cornerRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
                bottomRight: Radius.circular(100.r),
                bottomLeft: Radius.circular(100.r),
              ),

              // shadowColor: Colors.deepPurple,
              circleShadowColor: const Color(0xffFF0050).withOpacity(0.5),
              elevation: 10,
              
            ),
          ),
        ),
      ),
    );
  }
}
