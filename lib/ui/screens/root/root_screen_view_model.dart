import 'package:demo_app/ui/screens/home_screens/home_screen.dart';
import 'package:demo_app/ui/screens/screen_2/screen_2.dart';
import 'package:demo_app/ui/screens/screen_3/screen_3.dart';
import 'package:flutter/material.dart';

import '../../../core/enums/view_state.dart';
import '../../../core/others/base_view_model.dart';

class RootScreenViewModel extends BaseViewModel {
  List<Widget> allScreen = [
    const HomeScreen(),
    // const Screen2(),
    const Screen2(),
    const Screen3(),
  ];
  int selectedScreen = 0;
  bool isEnableBottomBar = true;

  updatedScreenIndex(int index) {
    setState(ViewState.busy);
    selectedScreen = index;
    setState(ViewState.idle);
  }
}
