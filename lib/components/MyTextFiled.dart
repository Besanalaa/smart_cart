import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscueText;
  final PrefixIcon;

  const MyTextFiled({
    required this.controller,
    required this.hintText,
    required this.obscueText,
    required this.PrefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscueText,
        decoration: InputDecoration(
          prefixIcon: Icon(PrefixIcon),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
