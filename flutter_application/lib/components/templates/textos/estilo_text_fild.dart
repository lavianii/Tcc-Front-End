import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EstiloTextFild extends StatefulWidget {
  final String? label;
  final IconData? iconData;
  final bool obscureText;
  final TextEditingController? controller;
  String? Function(String?)? validator;
  TextInputAction? textInputAction;
  void Function(String?)? onSaved;
  void Function(String)? onFieldSubmitted;
  String? hintText;

  EstiloTextFild({
    Key? key,
    this.label,
    this.iconData,
    this.obscureText = false,
    this.onSaved,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
    this.controller,
    required this.hintText
  }) : super(key: key);

  @override
  State<EstiloTextFild> createState() => _EstiloTextFildState();
}

class _EstiloTextFildState extends State<EstiloTextFild> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 80,
      child: TextFormField(
        obscureText: widget.obscureText,
        onSaved: widget.onSaved,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        controller: widget.controller,
        
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40.0),
            ),
          ),
          prefixIcon: Icon(widget.iconData),
        ),
      ),
    );
  }
}
