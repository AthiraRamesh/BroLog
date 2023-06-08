import 'package:Brolog/db/student_db/studentdb.dart';
import 'package:flutter/material.dart';
import '../../widgets/ImageWidgets/Attendance_image.dart';
import '../../widgets/ImageWidgets/Bubbles_image.dart';
import '../../widgets/ElevatedButton.dart';
import '../../widgets/TextHeading.dart';
import './liststudent.dart';
import './addstudent.dart';

class HomeStudentScreen extends StatefulWidget {
  final String batch_name;
  const HomeStudentScreen({
    super.key,
    required this.batch_name,
  });

  @override
  State<HomeStudentScreen> createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  @override
  Widget build(BuildContext context) {
    String batch_name = widget.batch_name;
    getallstudents(batch_name);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Student Details"),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BubblesImageWidget(),
            myTextView("$batch_name"),
          ],
        ),
        SingleChildScrollView(
          child: Container(
            height: 400,
            child: Column(
              children: [
                // myTextView("$batch_name - Student Details"),
                // const SizedBox(
                //   height: 20,
                // ),
                const Expanded(
                  child: ListStudentScreen(),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyElevatedButton(
                  text: 'Add New Student',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddStudentScreen(batch_name: batch_name)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        // const SizedBox(
        //   height: 20,
        // ),
        // AttendanceImageWidget(),
      ]),
    );
  }
}
