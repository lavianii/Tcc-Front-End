import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BotaoIcone extends StatefulWidget {

  
  void Function()? onPressed;
  final String text;
  final IconData icon;
  final int color;
  final int colorText;
  final int colorIcon;
  final double width;

  BotaoIcone({
    Key? key,
    required this.text,
    this.onPressed,
    required this.color,
    required this.icon,
    required this.width,
    required this.colorText,
    required this.colorIcon
  }) : super(key: key);

  @override
  State<BotaoIcone> createState() => _BotaoIcone();
}

class _BotaoIcone extends State<BotaoIcone> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: ElevatedButton.icon(
        onPressed: widget.onPressed,
        icon:  Icon(widget.icon,color: Color(widget.colorIcon),),
        label: Text(
          widget.text, 
          style: TextStyle(
            color: Color(widget.colorText),),
          ),
        style: ElevatedButton.styleFrom(
          backgroundColor:  Color(widget.color),
        ),
      ),
    );
  }
}
