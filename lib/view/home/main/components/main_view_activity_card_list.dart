part of '../view/main_view.dart';

extension MainViewActivityCardListExtension on _MainViewState {
  Widget get buildActivityCardList => SizedBox(
        height: context.calculateDynamicHeight(35),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: activities.length,
          itemBuilder: (context, index) => ActivityCard(
              item: activities[index],
              onClicked: () {},
              color: index % 2 == 0 ? Colors.red : Colors.orangeAccent,
              isFirst: index == 0),
        ),
      );
}
