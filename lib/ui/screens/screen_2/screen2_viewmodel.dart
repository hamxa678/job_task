import 'dart:math';
import 'package:demo_app/core/models/body/chart_data_body.dart';
import 'package:demo_app/core/others/base_view_model.dart';

class Screen2ViewModel extends BaseViewModel {
  DateTime selectedDate = DateTime.now();

  /// Change the selected day.
  changeDay(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  /// Dummy chart data.
  final List<LineChartData> chartData1 = [
    ...List.generate(12, (index) {
      return LineChartData(DateTime(2024, index + 1), Random().nextInt(100));
    })
  ];

  /// Dummy chart data.
  final List<LineChartData> chartData2 = [
    ...List.generate(14, (index) {
      return LineChartData(DateTime(2024, index + 1), Random().nextInt(100));
    })
  ];

  /// Week days
  final List<String> weekDays = const [
    "Mo",
    "Tu",
    "We",
    "Th",
    "Fr",
    "Sa",
    "Su",
  ];
}
