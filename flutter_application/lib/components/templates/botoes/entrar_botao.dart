import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EntrarBotao extends StatelessWidget {
  final String text;
  void Function()? onPressed;

  EntrarBotao({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_forward),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff152C42),
        ),
      ),
    );
  }
}
