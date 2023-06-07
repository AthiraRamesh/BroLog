import 'package:Brolog/db/student_db/studentdb.dart';
import 'package:flutter/material.dart';
import '../../widgets/ImageWidgets/Attendance_image.dart';
import '../../widgets/ImageWidgets/Bubbles_image.dart';
import '../../screens/batch/listbatch.dart';
import '../../widgets/FloatingActionButton.dart';
import '../../db/batch_db/batchdb.dart';
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
    getallstudents();
    String batch_name = widget.batch_name;
    // print('@Home_student page Batch Name: $batch_name');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        BubblesImageWidget(),
        SingleChildScrollView(
          child: Container(
            height: 500,
            child: Column(
              children: [
                myTextView("$batch_name - Student Details"),
                const Expanded(child: ListStudentScreen()),
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
        const SizedBox(
          height: 20,
        ),
        AttendanceImageWidget(),
      ]),
    );
  }
}
