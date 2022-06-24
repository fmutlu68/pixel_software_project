import 'package:flutter/material.dart';

class Activity {
  final IconData icon;
  final TimeOfDay time;
  final String title;
  final String subtitle;
  final String location;
  final DateTime? date;
  Activity({
    required this.icon,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.location,
    this.date,
  });
}
