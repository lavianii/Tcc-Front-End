import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BotaoAbreLink extends StatelessWidget {
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final int colorBackground;
  final int colorText;
  final String text;
  final double opacity;
  final String link;

  const BotaoAbreLink({
    Key? key,
    required this.paddingLeft,
    required this.paddingTop,
    required this.paddingRight,
    required this.paddingBottom,
    required this.colorBackground,
    required this.colorText,
    required this.text,
    required this.opacity,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(
              paddingLeft, paddingTop, paddingRight, paddingBottom),
          backgroundColor: Color(colorBackground).withOpacity(opacity),
          foregroundColor: Color(colorText),
          elevation: 0,
        ),
        onPressed: (() async {
          final Uri _url = Uri.parse(link);

          if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
            throw 'Could not launch $_url';
          }
        }),
        child: Text(text),
      ),
    );
  }
}
