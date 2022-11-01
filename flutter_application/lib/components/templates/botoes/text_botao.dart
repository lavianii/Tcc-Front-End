import 'package:flutter/material.dart';


class TextBotao extends StatefulWidget {
  void Function()? onPressed;
  final String text;
  final int colorText;

  TextBotao(
      {Key? key,
      required this.onPressed,
      required this.colorText,
      required this.text})
      : super(key: key);

  @override
  State<TextBotao> createState() => _TextBotaoState();
}

class _TextBotaoState extends State<TextBotao> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 17,
            color: Color(widget.colorText),
          ),
        ),
      ),
    );
  }
}
