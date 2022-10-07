import 'package:flutter/material.dart';

class Paragrafo extends StatelessWidget {
  final String texto;
  final double padding;

  const Paragrafo({Key? key, required this.texto, required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Text(texto,
          style: const TextStyle(
            color: Color(0xff152C42),
            fontSize: 17,
          )),
    ));
  }
}
