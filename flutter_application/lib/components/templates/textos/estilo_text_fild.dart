import 'package:flutter/material.dart';

class EstiloTextFild extends StatelessWidget {
  final String? label;
  final IconData? iconData;
  final bool obscureText;
  const EstiloTextFild({
    Key? key,
    this.label,
    this.iconData,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        obscureText: obscureText,
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
