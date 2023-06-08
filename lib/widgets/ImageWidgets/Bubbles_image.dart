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
        Container(
          child: Image.asset(
            'images/bubbles.png',
            height: 144,
            width: 160,
            alignment: Alignment.topLeft,
          ),
        )
      ],
    );
  }
}
// class BubblesImageWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//               'images/bubbles.png',
//             ), // Replace "image.jpg" with the actual filename and extension of your image
//             fit: BoxFit.cover,
//           ),
//         ),
//         // Replace this with your actual content widget
//       ),
//     );
//   }
// }
