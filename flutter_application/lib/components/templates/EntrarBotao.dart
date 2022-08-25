// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EntrarBotao extends StatelessWidget {
  final String text;

  const EntrarBotao({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.arrow_forward),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(21, 44, 66, 0.9),
        ),
      ),
    );
  }
}
