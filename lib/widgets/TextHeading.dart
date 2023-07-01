import 'package:flutter/material.dart';

Widget myTextView(
  String label, {
  double scale = 1,
}) {
  return Center(
    child: Text(
      label,
      textScaleFactor: scale,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    ),
  );
}
