part of '../view/main_view.dart';

extension MainViewAppointmentCardListExtension on _MainViewState {
  Widget get buildAppointmentCardList => SizedBox(
        height: context.calculateDynamicHeight(31),
        child: TinderSwapCard(
          cardBuilder: (context, index) => AppointmentCard(
              appointment: appointments[index],
              onCardClosed: controller.triggerLeft),
          totalNum: appointments.length,
          maxWidth: context.calculateDynamicWidth(98),
          maxHeight: context.calculateDynamicWidth(55),
          minWidth: context.calculateDynamicWidth(78),
          minHeight: context.calculateDynamicWidth(48),
          orientation: AmassOrientation.top,
          stackNum: appointments.length,
          cardController: controller,
        ),
      );
}
