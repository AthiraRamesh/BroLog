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
        // Positioned.fill(
        //   child: Image.asset(
        //     "assets/background.jpg",
        //     fit: BoxFit.fitWidth,
        //     alignment: Alignment.bottomLeft,
        //   ),
        // ),
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
