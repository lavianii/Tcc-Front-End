import 'package:flutter/material.dart';

class EstiloTextFild extends StatelessWidget {
  final String label;
  final IconData iconData;

  const EstiloTextFild({Key? key, required this.label, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: 'Digite $label...',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40.0),
            ),
          ),
          prefixIcon: Icon(iconData),
        ),
      ),
    );
  }
}
