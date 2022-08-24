import 'package:flutter/material.dart';

class BotaoPadrao extends StatelessWidget {

  final double paddingLeft ;
  final double paddingTop ;
  final double paddingRight ;
  final double paddingBottom ;
  final colorBackground;
  final colorText;
  final String text;


  const BotaoPadrao({Key? key, required this.paddingLeft,required this.paddingTop,required this.paddingRight,
                         required this.paddingBottom, required this.colorBackground , required this.colorText, required this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.fromLTRB(paddingLeft, paddingTop, paddingRight, paddingBottom),
              primary: Color(colorBackground),
              onPrimary: Color(colorText),
            ),
            onPressed: () {},
            child: Text(text),
          ),
       )
          
      );
  }
}