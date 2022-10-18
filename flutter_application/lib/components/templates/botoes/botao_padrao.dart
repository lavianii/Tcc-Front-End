import 'package:flutter/material.dart';


class BotaoPadrao extends StatefulWidget {

  
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final int colorBackground;
  final int colorText;
  final String text;
  final double opacity;
  Function() funcao;



    BotaoPadrao({
    Key? key,
    required this.paddingLeft,
    required this.paddingTop,
    required this.paddingRight,
    required this.paddingBottom,
    required this.colorBackground,
    required this.colorText,
    required this.text,
    required this.opacity,
    required this.funcao,

  }) : super(key: key);

  @override
  State<BotaoPadrao> createState() => _BotaoPadraoState();
}

class _BotaoPadraoState extends State<BotaoPadrao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(widget.paddingLeft,widget.paddingTop,widget.paddingRight,widget.paddingBottom),
          backgroundColor: Color(widget.colorBackground).withOpacity(widget.opacity),
          foregroundColor: Color(widget.colorText),
          elevation: 0,
        ),

        onPressed: widget.funcao,
        child: Text(widget.text),
        
      ),
    );
  }
}
