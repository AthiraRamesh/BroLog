import 'package:flutter/material.dart';

Widget myText(
  String label, {
  double scale = 1,
}) {
  return Container(
    child: Text(
      label, textScaleFactor: scale,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      //textAlign: TextAlign.center,
    ),
  );
}
