import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CardsConta extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final int color;

  // ignore: prefer_const_constructors_in_immutables
  CardsConta(
      {super.key,
      required this.width,
      required this.height,
      required this.text,
      required this.color});

  @override
  State<CardsConta> createState() => _CardsContaState();
}

class _CardsContaState extends State<CardsConta> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      alignment: const AlignmentDirectional(0, 0),
      child: Text(
        widget.text,
        style: const TextStyle(fontSize: 16),
      ),
      decoration: BoxDecoration(
          color: Color(widget.color),
          border: Border.all(color: const Color.fromARGB(95, 212, 212, 212))),
    );
  }
}
