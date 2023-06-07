import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MyFloatingActionButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        child: FloatingActionButton(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          onPressed: onPressed,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
 

//  ElevatedButton(
//           style: ElevatedButton.styleFrom(
//               minimumSize: const Size(280, 55),
//               textStyle: const TextStyle(fontSize: 20),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30))),
//           onPressed: onPressed,
//           child: Text(text),
//         ),