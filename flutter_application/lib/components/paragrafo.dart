import 'package:flutter/material.dart';

class paragrafo extends StatelessWidget {

   final String texto;
   final double padding;



  const paragrafo({Key? key, required this.texto, required this.padding}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return (
            Padding(
              padding:  EdgeInsets.symmetric(vertical: padding),
              child: Text(
                  texto,
                  style: const TextStyle(
                    color: Color(0xfffdfcf9),
                    fontSize:  20,
                  )
                ),
            )
      );
  }
}