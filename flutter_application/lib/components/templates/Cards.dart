
import 'package:flutter/material.dart';

class Cards extends StatefulWidget {

   final color;
   final double width;
   final double height;
   final double marginLeft;
   final double marginTop;
   final double marginRight;
   final double marginBottom;
   final double paddingLeft;
   final double paddingTop;
   final double paddingRight;
   final double paddingBottom;
   final Widget child;
   final double opacity;

  const Cards({Key? key, required this.width, required this.height,required this.color,
            required this.marginLeft, required this.marginTop,required this.marginRight,
              required this.marginBottom,required this.paddingLeft,required this.paddingTop,
              required this.paddingRight, required this.paddingBottom,required this.child, 
              required this.opacity,}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return (
        Container(
          width: widget.width,
          height: widget.height,
          color: Color(widget.color).withOpacity(widget.opacity),
          margin: EdgeInsets.fromLTRB(widget.marginLeft, widget.marginTop, widget.marginRight, widget.marginBottom),
          padding: EdgeInsets.fromLTRB(widget.paddingLeft,widget.paddingTop,widget.paddingRight,widget.paddingBottom),
          child: widget.child,
      )
    );
  }
}
