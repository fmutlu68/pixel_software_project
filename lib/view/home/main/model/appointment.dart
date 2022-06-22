import 'package:flutter/material.dart';

class Appointment {
  final String name;
  final String surname;
  final String userPhotoUrl;
  final int appointmentDuration;
  final TimeOfDay appointmentStartTime;
  final bool isOk;
  Appointment({
    required this.name,
    required this.surname,
    required this.userPhotoUrl,
    required this.appointmentDuration,
    required this.appointmentStartTime,
    required this.isOk,
  });
}
