part of '../view/main_view.dart';

extension MainViewCalendarDataChartExtension on _MainViewState {
  Widget get buildCalendarDataChart => SizedBox(
        height: context.calculateDynamicHeight(37),
        child: SfCartesianChart(
          series: <ChartSeries<CalendarData, String>>[
            LineSeries<CalendarData, String>(
              dataSource: calendarData,
              xValueMapper: (v, i) => v.title,
              yValueMapper: (v, i) => v.data,
              width: 3,
              color: Colors.orangeAccent,
              animationDuration: 10,
            )
          ],
          primaryYAxis:
              NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
          primaryXAxis:
              CategoryAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
        ),
      );
}
