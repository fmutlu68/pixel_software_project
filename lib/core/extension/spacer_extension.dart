import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/core/extension/context_extension.dart';

extension SpacerExtension on BuildContext {
  SizedBox get veryLowHeightSpacer => SizedBox(
        height: veryLowHeight,
      );
  SizedBox get veryLowWidthSpacer => SizedBox(
        width: veryLowWidth,
      );
}
