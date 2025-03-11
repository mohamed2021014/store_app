import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostemTextFiled extends StatelessWidget {
  final String hint;
  final String label;
  Widget? icon;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  bool obscureText = false;
  CostemTextFiled({
    super.key,
    required this.hint,
    required this.label,
    this.icon,
    this.validator,
    this.keyboardType,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodySmall,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hint,
        labelText: label,
      ),
    );
  }
}
