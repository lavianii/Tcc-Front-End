// ignore_for_file: file_names

import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Image.asset('lib/components/assets/images/logo.png'),
    );
  }
}
