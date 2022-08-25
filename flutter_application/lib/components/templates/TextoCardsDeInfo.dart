import 'package:flutter/material.dart';

class TextoCardsDeInfo extends StatelessWidget {

  final String texto;
  const TextoCardsDeInfo({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Text(
            texto,
            style: const  TextStyle(
                color: Color(0xffffffff),
                fontSize:  17,
        )
      )
    );
   
  }
}