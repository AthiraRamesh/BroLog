import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  MyTextFormField(
      {required this.controller,
      required this.labelText,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 16, fontFamily: "poppins", color: Colors.grey),
            filled: true,
            fillColor: const Color.fromARGB(255, 232, 229, 229),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
