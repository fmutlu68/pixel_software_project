import 'package:flutter/material.dart';

class Report {
  final String title;
  final String value;
  final double percent;
  final Color color;
  final String? extraValue;
  Report({
    required this.title,
    required this.value,
    required this.percent,
    required this.color,
    this.extraValue,
  });
}
