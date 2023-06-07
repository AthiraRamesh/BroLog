import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final Image? ButtonImage;
  const ImageWidget({
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
          'images/login.png',
          height: 200,
          width: double.infinity,
          alignment: Alignment.topRight,
        ))
      ],
    );
  }
}
