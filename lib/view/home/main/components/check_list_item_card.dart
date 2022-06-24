import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/core/extension/context_extension.dart';
import 'package:flutter_pixel_project/core/extension/spacer_extension.dart';
import 'package:flutter_pixel_project/core/extension/theme_extension.dart';

import '../model/check_list_item.dart';

class CheckListItemCard extends StatelessWidget {
  final CheckListItem item;
  final VoidCallback onClicked;
  const CheckListItemCard(
      {Key? key, required this.item, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.veryLowWidth),
      child: InkWell(
        onTap: onClicked,
        child: Container(
          height: context.lowHeight,
          width: context.calculateDynamicWidth(35),
          padding: EdgeInsets.only(
            left: context.veryLowWidth,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(context.veryLowWidth),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                  iconSize: context.calculateDynamicWidth(4),
                  constraints: BoxConstraints(
                      maxHeight: context.calculateDynamicHeight(2),
                      minHeight: context.calculateDynamicHeight(2) / 2,
                      maxWidth: context.calculateDynamicWidth(7.5),
                      minWidth: context.calculateDynamicWidth(7.5))),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade300),
                    child: Icon(
                      item.icon,
                      color: item.color,
                    ),
                  ),
                ],
              ),
              context.veryLowHeightSpacer,
              Row(
                children: [
                  Text(item.title, style: context.textTheme.subtitle1),
                ],
              ),
              context.veryLowHeightSpacer,
              Row(
                children: [
                  Text(item.subtitle, style: context.textTheme.caption),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
