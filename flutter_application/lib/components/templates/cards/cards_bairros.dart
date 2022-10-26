// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';


class CardsBairros extends StatefulWidget {
  final String textSuperior;
  final String textInferior;

  final int colorSuperior;
  final int colorInferior;

  final double paddingSuperior;
  final double width;
  final double height;
  final double borderRadius;

  const CardsBairros(
      {Key? key,
      required this.textSuperior,
      required this.colorInferior,
      required this.colorSuperior,
      required this.textInferior,
      required this.paddingSuperior,
      required this.width,
      required this.height,
      required this.borderRadius})
      : super(key: key);

  @override
  State<CardsBairros> createState() => _CardsBairrosState();
}

class _CardsBairrosState extends State<CardsBairros> {
  @override
  Widget build(BuildContext context) {
    return

        //coluna que contem o card
        Column(children: [
      //Parte superior do card
      Card(
        elevation: 10,
        shadowColor: Colors.black87,
        color: Color(widget.colorSuperior),
        child: Container(
          padding: EdgeInsets.only(top: widget.paddingSuperior),
          child: Column(
            children: [
              Text(
                widget.textSuperior,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),

              //parte inferior do card
              Container(
                margin: const EdgeInsets.only(top: 15),
                alignment: const Alignment(0, 0),
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  color: Color(widget.colorInferior),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.textInferior,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
