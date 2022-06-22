// // ignore_for_file: recursive_getters
// import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'package:flutter_pixel_project/core/extension/context_extension.dart';
import 'package:flutter_pixel_project/core/extension/spacer_extension.dart';
import 'package:flutter_pixel_project/core/extension/theme_extension.dart';

import '../model/appointment.dart';

// class AppointmentCard extends StatelessWidget {
//   final double minHeight;
//   final double maxHeight;
//   final bool pinned;
//   final bool floating;
//   final Appointment appointment;

//   const AppointmentCard({
//     Key? key,
//     required this.minHeight,
//     required this.maxHeight,
//     required this.pinned,
//     required this.floating,
//     required this.appointment,
//   }) : super(key: key);

//   SliverPersistentHeaderDelegate get _delegate => _AppointmentCardDelegate(
//       minHeight: minHeight,
//       maxHeight: maxHeight,
//       child: _AppointmentContentCard(appointment: appointment));

//   @override
//   Widget build(BuildContext context) {
//     print("Max: $maxHeight, Min: $minHeight");
//     return SliverPersistentHeader(
//         key: key, pinned: pinned, floating: floating, delegate: _delegate);
//   }
// }

// class _AppointmentCardDelegate extends SliverPersistentHeaderDelegate {
//   final double minHeight;
//   final double maxHeight;
//   final Widget child;

//   const _AppointmentCardDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.child,
//   });
//   @override
//   Widget build(
//           BuildContext context, double shrinkOffset, bool overlapsContent) =>
//       SizedBox.expand(child: child);

//   @override
//   double get maxExtent => math.max(maxHeight, minHeight);

//   @override
//   double get minExtent => minHeight;

//   @override
//   bool shouldRebuild(_AppointmentCardDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         child != oldDelegate.child;
//   }
// }

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final VoidCallback onCardClosed;
  const AppointmentCard({
    Key? key,
    required this.appointment,
    required this.onCardClosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(context.lowWidth)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          buildCloseButton(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoButton(context),
                  context.veryLowHeightSpacer,
                  Text.rich(TextSpan(
                    children: [
                      buildAppointmentInfoText(context),
                      WidgetSpan(child: context.lowWidthSpacer),
                      buildAppointmentIsOkText(context),
                    ],
                  ))
                ],
              ),
              buildAppointmentUserImage(context),
            ],
          ),
          context.veryLowHeightSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              context.lowWidthSpacer,
              Text("Randevu Süresi: ${appointment.appointmentDuration} dk",
                  style: context.textTheme.bodyText1?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w200)),
            ],
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(Icons.watch_later),
                  Text(
                      " Randevu Saati: ${appointment.appointmentStartTime.hour}.${appointment.appointmentStartTime.minute}"),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.mail_outline)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.video_call)),
                ],
              ),
            ],
          ),
          context.veryLowHeightSpacer,
        ],
      ),
    );
  }

  CircleAvatar buildAppointmentUserImage(BuildContext context) {
    return CircleAvatar(
      radius: context.calculateDynamicWidth(8),
      backgroundImage: NetworkImage(appointment.userPhotoUrl),
    );
  }

  TextSpan buildAppointmentIsOkText(BuildContext context) {
    return TextSpan(
        text: appointment.isOk ? "Onaylandı" : "Onaylanmadı",
        style: context.textTheme.caption?.copyWith(
          color: appointment.isOk ? Colors.white : Colors.red,
        ));
  }

  TextSpan buildAppointmentInfoText(BuildContext context) {
    return TextSpan(
      text: "${appointment.name} ${appointment.surname}",
      style: context.textTheme.headline6
          ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Text buildInfoButton(BuildContext context) {
    return Text(
      "Yaklaşan bir randevun var!",
      style: context.textTheme.headline6
          ?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
    );
  }

  IconButton buildCloseButton(BuildContext context) {
    return IconButton(
        onPressed: onCardClosed,
        icon: const Icon(Icons.close),
        iconSize: context.calculateDynamicWidth(4),
        constraints: BoxConstraints(
            maxHeight: context.calculateDynamicHeight(2),
            minHeight: context.calculateDynamicHeight(2) / 2,
            maxWidth: context.calculateDynamicWidth(7.5),
            minWidth: context.calculateDynamicWidth(7.5)));
  }
}
