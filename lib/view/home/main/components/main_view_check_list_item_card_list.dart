part of '../view/main_view.dart';

extension MainViewCheckListItemCardListExtension on _MainViewState {
  Widget get buildCheckListItemCardList => SizedBox(
        height: context.calculateDynamicHeight(20),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: checkListItems.length,
          itemBuilder: (context, index) =>
              CheckListItemCard(item: checkListItems[index], onClicked: () {}),
        ),
      );
}
