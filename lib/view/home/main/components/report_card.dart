import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/core/extension/context_extension.dart';
import 'package:flutter_pixel_project/core/extension/spacer_extension.dart';
import 'package:flutter_pixel_project/core/extension/theme_extension.dart';

import 'package:flutter_pixel_project/view/home/main/model/report.dart';

class ReportCard extends StatelessWidget {
  final VoidCallback onClicked;
  final Report report;
  const ReportCard({
    Key? key,
    required this.onClicked,
    required this.report,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        height: context.veryLowHeight,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(context.veryLowWidth),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  report.title,
                  style: context.textTheme.caption?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      report.value,
                      style: context.textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (report.extraValue != null) ...[
                      context.lowWidthSpacer,
                      Text(
                        report.extraValue!,
                        style: TextStyle(color: report.color),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "%${report.percent}",
                  style: context.textTheme.bodySmall
                      ?.copyWith(color: report.color),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: report.color, width: 10)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
