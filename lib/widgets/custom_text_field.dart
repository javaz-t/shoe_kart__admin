import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  CustomTextField({required this.controller, required this.hintText,required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: hintText,
      ),
    );
  }
}
