import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/core/extension/theme_extension.dart';

class TextWithNumberDetailCard extends StatefulWidget {
  final String text;
  final String numberText;
  const TextWithNumberDetailCard(
      {Key? key, required this.text, required this.numberText})
      : super(key: key);

  @override
  State<TextWithNumberDetailCard> createState() =>
      _TextWithNumberDetailCardState();
}

class _TextWithNumberDetailCardState extends State<TextWithNumberDetailCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(widget.numberText, style: context.textTheme.headline4),
          Text(widget.text,
              style: context.textTheme.subtitle2
                  ?.copyWith(fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }
}
