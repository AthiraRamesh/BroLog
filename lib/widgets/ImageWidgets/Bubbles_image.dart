import 'package:flutter/material.dart';

class BubblesImageWidget extends StatelessWidget {
  final Image? ButtonImage;
  const BubblesImageWidget({
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
            'images/bubbles.png',
            height: 144,
            width: double.infinity,
            alignment: Alignment.topLeft,
          ),
        )
      ],
    );
  }
}
