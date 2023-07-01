import 'package:flutter/material.dart';
import '../widgets/ImageWidgets/Bubbles_image.dart';
import '../widgets/ElevatedButton.dart';
import './login.dart';
import '../widgets/TextHeading.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          //BubblesImageWidget(),
          const SizedBox(
            height: 200,
          ),
          Container(
            //height: 400,
            child: Column(
              children: [
                //myTextView("BroLog"),
                Text(
                  'BroLog',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                Image.asset(
                  'images/Welcome.png',
                ),
                // Image.asset(
                //   'images/start.png',
                // ),
                MyElevatedButton(
                  text: 'Let\'s get to work! ',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
