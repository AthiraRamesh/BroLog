import 'package:flutter/material.dart';
import '../widgets/TextHeading.dart';
import '../widgets/ImageWidgets/Bubbles_image.dart';
import '../widgets/ImageWidgets/Login_image.dart';
import '../widgets/TextField.dart';
import '../widgets/ElevatedButton.dart';
import '../screens/batch/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          BubblesImageWidget(),
          ImageWidget(),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Container(
              height: 300,
              child: Column(
                children: [
                  myTextView("Admin Login"),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                    controller: myController,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                    controller: myController,
                    labelText: 'Password',
                    hintText: 'Confirm Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyElevatedButton(
                    text: 'Login',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
