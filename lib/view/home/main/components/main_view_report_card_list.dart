part of '../view/main_view.dart';

extension MainViewReportCardListExtension on _MainViewState {
  Widget get buildReportCardList => SizedBox(
        height: context.calculateDynamicHeight(32),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: context.calculateDynamicHeight(15),
              mainAxisSpacing: 11,
              crossAxisSpacing: 10),
          itemCount: reports.length,
          itemBuilder: (context, index) {
            return ReportCard(onClicked: () {}, report: reports[index]);
          },
        ),
      );
}
