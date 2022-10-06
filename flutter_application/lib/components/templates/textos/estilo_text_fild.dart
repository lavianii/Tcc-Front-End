import 'package:flutter/material.dart';

class EstiloTextFild extends StatelessWidget {
  final String? label;
  final IconData? iconData;
  final bool obscureText;
  void Function(String?)? onSaved;
  String? Function(String?)? validator;
  TextInputAction? textInputAction;
  void Function(String)? onFieldSubmitted;


    EstiloTextFild({
    Key? key,
    this.label,
    this.iconData,
    this.obscureText = false,
    this.onSaved,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        obscureText: obscureText,
        onSaved: onSaved,
        textInputAction: textInputAction ,
        validator: validator,
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
