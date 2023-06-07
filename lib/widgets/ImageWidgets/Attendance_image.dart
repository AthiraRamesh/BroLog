import 'package:flutter/material.dart';

class AttendanceImageWidget extends StatelessWidget {
  final Image? ButtonImage;
  const AttendanceImageWidget({
    super.key,
    this.ButtonImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            'images/attendance.jpg',
            height: 100,
            width: double.infinity,
            alignment: Alignment.bottomRight,
          ),
        )
      ],
    );
  }
}
