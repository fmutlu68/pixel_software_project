import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/core/extension/context_extension.dart';
import 'package:flutter_pixel_project/core/extension/spacer_extension.dart';
import 'package:flutter_pixel_project/core/extension/theme_extension.dart';
import 'package:flutter_pixel_project/view/home/main/components/appointment_card.dart';
import 'package:flutter_pixel_project/view/home/main/components/report_card.dart';
import 'package:flutter_pixel_project/view/home/main/model/appointment.dart';
import 'package:flutter_pixel_project/view/home/main/model/report.dart';
import 'package:flutter_swipecards/flutter_swipecards.dart';

part '../components/main_view_appointment_card_list.dart';
part '../components/main_view_report_card_list.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late final List<Appointment> appointments;
  late final List<Report> reports;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(context.lowWidth),
        child: Column(
          children: [
            buildAppointmentsInfoTexts,
            buildAppointmentCardList,
            buildReportsInfoTexts,
            buildReportCardsList,
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
                  style: context.textTheme.bodyText1
                      ?.copyWith(fontWeight: FontWeight.w400)),
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
                  style: context.textTheme.bodyText1
                      ?.copyWith(fontWeight: FontWeight.w400)),
              backgroundColor: Colors.transparent,
              onPressed: () {}),
          RawChip(
              padding: EdgeInsets.zero,
              label: Text("Tümünü Görüntüle", style: context.textTheme.caption),
              backgroundColor: Colors.transparent,
              onPressed: () {})
        ],
      );

  Widget get buildUserOnlineStatusTile {
    bool isOnline = true;
    return ListTile(
      visualDensity: VisualDensity.compact,
      leading: Container(
        height: context.calculateDynamicHeight(15),
        width: context.calculateDynamicHeight(10),
        child: Icon(
          Icons.lock,
          color: Colors.orange,
        ),
      ),
      title: Text("ONLINE"),
      subtitle: Text("SİSTEM ÜZERİNDE ONLINESIN"),
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
