import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/core/extension/context_extension.dart';
import 'package:flutter_pixel_project/core/extension/spacer_extension.dart';
import 'package:flutter_pixel_project/core/extension/theme_extension.dart';
import 'package:flutter_pixel_project/view/home/main/components/activity_card.dart';
import 'package:flutter_pixel_project/view/home/main/components/appointment_card.dart';
import 'package:flutter_pixel_project/view/home/main/components/check_list_item_card.dart';
import 'package:flutter_pixel_project/view/home/main/components/report_card.dart';
import 'package:flutter_pixel_project/view/home/main/model/activity.dart';
import 'package:flutter_pixel_project/view/home/main/model/appointment.dart';
import 'package:flutter_pixel_project/view/home/main/model/calendar_data.dart';
import 'package:flutter_pixel_project/view/home/main/model/check_list_item.dart';
import 'package:flutter_pixel_project/view/home/main/model/report.dart';
import 'package:flutter_swipecards/flutter_swipecards.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

part '../components/main_view_appointment_card_list.dart';
part '../components/main_view_report_card_list.dart';
part '../components/main_view_check_list_item_card_list.dart';
part '../components/main_view_activity_card_list.dart';
part '../components/main_view_calendar_data_chart.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late final List<Appointment> appointments;
  late final List<Report> reports;
  late final List<CheckListItem> checkListItems;
  late final List<Activity> activities;
  late final List<CalendarData> calendarData;
  late final CardController controller;
  @override
  void initState() {
    super.initState();
    controller = CardController();
    appointments = [
      Appointment(
        name: "Abdullah",
        surname: "Okutan",
        appointmentDuration: 75,
        appointmentStartTime: const TimeOfDay(hour: 15, minute: 59),
        isOk: true,
        userPhotoUrl:
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
      ),
      Appointment(
        name: "Mehmet",
        surname: "Uzuner",
        appointmentDuration: 55,
        appointmentStartTime: const TimeOfDay(hour: 17, minute: 45),
        isOk: false,
        userPhotoUrl:
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
      ),
      Appointment(
        name: "Kemal",
        surname: "Sayar",
        appointmentDuration: 40,
        appointmentStartTime: const TimeOfDay(hour: 19, minute: 30),
        isOk: true,
        userPhotoUrl:
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
      ),
    ];
    reports = [
      Report(
          title: "Toplam Kazanç",
          value: "240 TL",
          percent: 94,
          color: Colors.indigo),
      Report(
          title: "Yaklaşan Randevular",
          value: "5 Randevu",
          percent: 94,
          color: Colors.red),
      Report(
          title: "Değerlendirmeler",
          value: "160",
          percent: 94,
          color: Colors.orange,
          extraValue: "4.5"),
      Report(
          title: "Profil Ziyaretleri",
          value: "22",
          percent: 94,
          color: Colors.indigo),
    ];
    checkListItems = [
      CheckListItem(
        icon: Icons.ac_unit,
        color: Colors.yellowAccent,
        title: "Danışanlarım",
        subtitle: "5 Danışan",
      ),
      CheckListItem(
        icon: Icons.fitbit_sharp,
        color: Colors.red,
        title: "Randevularım",
        subtitle: "10 Randevu",
      ),
      CheckListItem(
        icon: Icons.access_alarm,
        color: Colors.yellowAccent,
        title: "Tedavilerim",
        subtitle: "7 Tedavi",
      ),
    ];
    activities = [
      Activity(
          icon: Icons.leak_remove,
          time: const TimeOfDay(hour: 12, minute: 20),
          title: "Chicken Wing Competition",
          subtitle: "Be ready to have fun competition",
          location: "Konya Türkiye"),
      Activity(
          icon: Icons.leak_remove,
          time: const TimeOfDay(hour: 14, minute: 20),
          title: "Design Semi Finals 2",
          subtitle: "Be ready to have fun competition",
          location: "Konya Türkiye"),
      Activity(
          icon: Icons.leak_remove,
          time: const TimeOfDay(hour: 12, minute: 20),
          title: "Chicken Wing Competition",
          subtitle: "Be ready to have fun competition",
          location: "Konya Türkiye"),
    ];
    calendarData = [
      CalendarData(title: "Kasım", data: 150),
      CalendarData(title: "Aralık", data: 200),
      CalendarData(title: "Ocak", data: 850),
      CalendarData(title: "Şubat", data: 850),
      CalendarData(title: "Mart", data: 1150),
      CalendarData(title: "Nisan", data: 1500),
      CalendarData(title: "Mayıs", data: 1500),
      CalendarData(title: "Haziran", data: 1250),
      CalendarData(title: "Temmuz", data: 950),
      CalendarData(title: "Ağustos", data: 800),
      CalendarData(title: "Eylül", data: 750),
      CalendarData(title: "Ekim", data: 750),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(context.lowWidth),
        child: ListView(
          children: [
            buildAppointmentsInfoTexts,
            buildAppointmentCardList,
            buildCheckListItemsInfoTexts,
            buildCheckListItemCardList,
            buildActivityInfoText,
            buildActivityCardList,
            buildCalendarDataItemsInfoTexts,
            buildCalendarDataChart,
            buildReportsInfoTexts,
            buildReportCardList,
            context.veryLowHeightSpacer,
            buildUserOnlineStatusTile,
          ],
        ),
      ),
    );
  }

  Widget get buildAppointmentsInfoTexts => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RawChip(
              label: Text("Son Bilgilendirmeler",
                  style: context.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.w300)),
              backgroundColor: Colors.transparent,
              onPressed: () {}),
          RawChip(
              label: Text("Tümünü Görüntüle", style: context.textTheme.caption),
              backgroundColor: Colors.transparent,
              onPressed: () {})
        ],
      );
  Widget get buildReportsInfoTexts => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RawChip(
              padding: EdgeInsets.zero,
              label: Text("Genel Raporlar",
                  style: context.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.w300)),
              backgroundColor: Colors.transparent,
              onPressed: () {}),
          RawChip(
              padding: EdgeInsets.zero,
              label: Text("Tümünü Görüntüle", style: context.textTheme.caption),
              backgroundColor: Colors.transparent,
              onPressed: () {})
        ],
      );
  Widget get buildCheckListItemsInfoTexts => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RawChip(
              padding: EdgeInsets.zero,
              label: Text("Genel Raporlar",
                  style: context.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.w300)),
              backgroundColor: Colors.transparent,
              onPressed: () {}),
          RawChip(
              padding: EdgeInsets.zero,
              label: Text("Tümünü Görüntüle", style: context.textTheme.caption),
              backgroundColor: Colors.transparent,
              onPressed: () {})
        ],
      );
  Widget get buildCalendarDataItemsInfoTexts => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RawChip(
              padding: EdgeInsets.zero,
              label: Text("Son Bilgilendirmeler",
                  style: context.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.w300)),
              backgroundColor: Colors.transparent,
              onPressed: () {}),
          RawChip(
              padding: EdgeInsets.zero,
              label: Text("Tümünü Görüntüle", style: context.textTheme.caption),
              backgroundColor: Colors.transparent,
              onPressed: () {})
        ],
      );
  Widget get buildActivityInfoText => Row(
        children: [
          RawChip(
              padding: EdgeInsets.zero,
              label: Text("Yaklaşan Aktviteler",
                  style: context.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.w300)),
              backgroundColor: Colors.transparent,
              onPressed: () {}),
        ],
      );

  Widget get buildUserOnlineStatusTile {
    bool isOnline = true;
    return ListTile(
      visualDensity: VisualDensity.compact,
      leading: SizedBox(
        height: context.calculateDynamicHeight(15),
        width: context.calculateDynamicHeight(10),
        child: const Icon(
          Icons.lock,
          color: Colors.orange,
        ),
      ),
      title: const Text("ONLINE"),
      subtitle: const Text("SİSTEM ÜZERİNDE ONLINESIN"),
      trailing: StatefulBuilder(builder: (context, setState) {
        return Switch(
            activeColor: Colors.orange,
            value: isOnline,
            onChanged: (_) {
              setState(() => isOnline = !isOnline);
            });
      }),
    );
  }
}
