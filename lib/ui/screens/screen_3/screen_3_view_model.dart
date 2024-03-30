import 'dart:math';

import 'package:demo_app/core/others/base_view_model.dart';
import 'package:demo_app/core/others/logger_customizations/custom_logger.dart';

import 'screen_3.dart';

class Screen3ViewModel extends BaseViewModel {
  final log = CustomLogger(className: 'Screen3ViewModel');
  String selectTabOfBarChart = '01 Month';

  void selectTabOfBarChartMethod(String title) {
    selectTabOfBarChart = title;
    notifyListeners();
  }

  bool isItSelected(String title) {
    return selectTabOfBarChart == title;
  }

  final List<SalesData> dataSource = [
    SalesData(DateTime(2023, 9, 8, 3, 30), 15),
    SalesData(DateTime(2023, 9, 8, 4, 30), 18),
    SalesData(DateTime(2023, 9, 8, 5, 30), 16),
    SalesData(DateTime(2023, 9, 8, 6, 30), 14),
    SalesData(DateTime(2023, 9, 8, 7, 30), 19),
    SalesData(DateTime(2023, 9, 8, 8, 30), 12),
    SalesData(DateTime(2023, 9, 8, 9, 30), 11),
    SalesData(DateTime(2023, 9, 8, 10, 30), 13),
    SalesData(DateTime(2023, 9, 8, 11, 30), 17),
    SalesData(DateTime(2023, 9, 8, 12, 30), 16),
    SalesData(DateTime(2023, 9, 8, 13, 30), 18),
    SalesData(DateTime(2023, 9, 8, 14, 30), 19),
    SalesData(DateTime(2023, 9, 8, 15, 30), 10),
    SalesData(DateTime(2023, 9, 8, 16, 30), 11),
    SalesData(DateTime(2023, 9, 8, 17, 30), 15),
    SalesData(DateTime(2023, 9, 8, 18, 30), 13),
    SalesData(DateTime(2023, 9, 8, 19, 30), 17),
    SalesData(DateTime(2023, 9, 8, 20, 30), 17),
    SalesData(DateTime(2023, 9, 8, 21, 30), 13),
    SalesData(DateTime(2023, 9, 8, 22, 30), 17),
    SalesData(DateTime(2023, 9, 8, 23, 30), 4),
    SalesData(DateTime(2023, 9, 9, 0, 30), 19),
    SalesData(DateTime(2023, 9, 9, 1, 30), 12),
    SalesData(DateTime(2023, 9, 9, 2, 30), 12),
    SalesData(DateTime(2023, 9, 9, 3, 30), 16),
    SalesData(DateTime(2023, 9, 9, 4, 30), 13),
    SalesData(DateTime(2023, 9, 9, 5, 30), 16),
    SalesData(DateTime(2023, 9, 9, 6, 30), 13),
    SalesData(DateTime(2023, 9, 9, 7, 30), 15),
    SalesData(DateTime(2023, 9, 9, 8, 30), 18),
    SalesData(DateTime(2023, 9, 9, 9, 30), 15),
    SalesData(DateTime(2023, 9, 9, 10, 30), 19),
    SalesData(DateTime(2023, 9, 9, 11, 30), 23),
    SalesData(DateTime(2023, 9, 9, 12, 30), 11),
    SalesData(DateTime(2023, 9, 9, 13, 30), 12),
    SalesData(DateTime(2023, 9, 9, 14, 30), 14),
    SalesData(DateTime(2023, 9, 9, 15, 30), 13),
    SalesData(DateTime(2023, 9, 9, 16, 30), 16),
    SalesData(DateTime(2023, 9, 9, 17, 30), 20),
    SalesData(DateTime(2023, 9, 9, 18, 30), 12),
    SalesData(DateTime(2023, 9, 9, 19, 30), 15),
    SalesData(DateTime(2023, 9, 9, 20, 30), 19),
    SalesData(DateTime(2023, 9, 9, 21, 30), 15),
    SalesData(DateTime(2023, 9, 9, 22, 30), 18),
    SalesData(DateTime(2023, 9, 9, 23, 30), 16),
    SalesData(DateTime(2023, 9, 10, 0, 30), 14),
    SalesData(DateTime(2023, 9, 10, 1, 30), 19),
    // generate sequence for two months
    ...List.generate(20, (index) {
      return SalesData(
        DateTime(2023, 9, 10, 2, 30).add(Duration(days: index)),
        Random().nextInt(30).toDouble(),
      );
    }),
  ];
}
