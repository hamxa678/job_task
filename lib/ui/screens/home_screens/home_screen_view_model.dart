import 'package:demo_app/core/models/other_models/dashboard_models/cart_data.dart';
import 'package:demo_app/core/models/other_models/dashboard_models/dashboard_model.dart';

import '../../../core/enums/view_state.dart';
import '../../../core/others/base_view_model.dart';

class HomeScreenViewModel extends BaseViewModel {

  /// Dummy chart data.
  final List<ChartData> chartData1 = [
            ChartData(2010, 25),
            ChartData(2011, 30),
            ChartData(2012, 20),
            ChartData(2013, 30),
            ChartData(2014, 15),
            ChartData(2015, 25),
            ChartData(2016, 30),
            ChartData(2017, 20),
            ChartData(2018, 30),
            ChartData(2019, 15)
        ];
  final List<ChartData> chartData2 = [
            ChartData(2010, 30),
            ChartData(2011, 20),
            ChartData(2012, 25),
            ChartData(2013, 20),
            ChartData(2014, 30),
            ChartData(2015, 25),
            ChartData(2016, 20),
            ChartData(2017, 25),
            ChartData(2018, 20),
            ChartData(2019, 30),
        ];
  
  /// Dummy dashboard data.
  final Dashboard dashboardData = Dashboard(
    overview: [
    Overview(title: 'Your Final Points', value: 1005),
    Overview(title: 'Average Points', value: 576),
    Overview(title: 'Highest Points', value: 3400),
    Overview(title: 'Total Active Time', value: 2),
  ], dailyactivity: Dailyactivity(noofsteps: 5070, moredata: [
    Overview(title: 'Distance', value: 500),
    Overview(title: 'Calories', value: 534),
    Overview(title: 'Time', value: 5400),
  ]));
  
  /// Initial selected tab index.
  final int initialSelectedTab = 0;
  /// Duration list.
  List<String> duration = ['Week', 'Month', 'Year'];
  
  /// Update the selected tab index.
  updatedScreenIndex(int index) {
    setState(ViewState.busy);
    setState(ViewState.idle);
  }
}
