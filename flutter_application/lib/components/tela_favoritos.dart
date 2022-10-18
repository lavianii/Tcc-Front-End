import 'package:flutter/material.dart';

class TelaFavoritos extends StatelessWidget {
  const TelaFavoritos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        backgroundColor: const Color(0xff77A8A6),
        foregroundColor: const Color(0xff000000),
      ),
      backgroundColor: const Color(0xffDFF5F4),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50,50,50,50),
        child: Column(
          children: const [
              
          ],
        ),
      ),
    );
  }
}