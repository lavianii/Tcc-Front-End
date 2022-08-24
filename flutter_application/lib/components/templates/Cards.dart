import 'package:flutter/material.dart';

class Cards extends StatelessWidget {

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
  Widget build(BuildContext context) {
    return (
        Container(
          width: width,
          height: height,
          color: Color(color).withOpacity(opacity),
          margin: EdgeInsets.fromLTRB(marginLeft, marginTop, marginRight, marginBottom),
          padding: EdgeInsets.fromLTRB(paddingLeft,paddingTop,paddingRight,paddingBottom),
          child: child,
      )
    );
  }
}