// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  final Widget child;
  final double alignmentX;
  final double alignmentY;

  const Cards(
      {Key? key,
      required this.width,
      required this.height,
      required this.color,
      required this.marginLeft,
      required this.marginTop,
      required this.marginRight,
      required this.marginBottom,
      required this.child,
      required this.alignmentX,
      required this.alignmentY})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: width,
      height: height,
      color: color,
      margin:
          EdgeInsets.fromLTRB(marginLeft, marginTop, marginRight, marginBottom),
      alignment: Alignment(alignmentX, alignmentY),
      child: child,
    ));
  }
}
