import 'package:flutter/material.dart';

import 'package:flutter_pixel_project/core/extension/context_extension.dart';
import 'package:flutter_pixel_project/core/extension/spacer_extension.dart';
import 'package:flutter_pixel_project/core/extension/theme_extension.dart';
import 'package:flutter_pixel_project/view/home/main/model/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity item;
  final VoidCallback onClicked;
  final Color color;
  final bool? isFirst;
  const ActivityCard({
    Key? key,
    required this.item,
    required this.onClicked,
    required this.color,
    this.isFirst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.veryLowWidth),
      child: InkWell(
        onTap: onClicked,
        child: Container(
          height: context.mediumHeight,
          width: context.calculateDynamicWidth(42),
          padding: EdgeInsets.symmetric(
            horizontal: context.calculateDynamicWidth(3),
          ),
          decoration: BoxDecoration(
            color: isFirst ?? false ? null : Colors.grey.shade200,
            gradient: isFirst ?? false
                ? LinearGradient(
                    colors: [Colors.yellow.shade600, Colors.orange],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)
                : null,
            borderRadius: BorderRadius.circular(context.veryLowWidth),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      item.icon,
                      color: color,
                    ),
                    iconSize: context.calculateDynamicWidth(4),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                    iconSize: context.calculateDynamicWidth(4),
                  ),
                ],
              ),
              context.veryLowHeightSpacer,
              Text("${item.time.hour}.${item.time.minute}"),
              context.veryLowHeightSpacer,
              Text(item.title, style: context.textTheme.subtitle1),
              context.veryLowHeightSpacer,
              Text(item.subtitle, style: context.textTheme.caption),
              context.veryLowHeightSpacer,
              Chip(
                label: Text(item.location),
                avatar: const Icon(Icons.location_on),
              )
            ],
          ),
        ),
      ),
    );
  }
}
