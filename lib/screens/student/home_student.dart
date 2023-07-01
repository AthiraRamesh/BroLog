import 'package:Brolog/db/student_db/studentdb.dart';
import 'package:Brolog/models/StudentModel.dart';
import 'package:Brolog/screens/student/display_student.dart';
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
        title: Text("$batch_name : Student Details"),
      ),
      body: const ListStudentScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddStudentScreen(batch_name: batch_name);
              },
            ),
          );
        },
        tooltip: 'Add Students',
        backgroundColor: Color.fromARGB(255, 213, 71, 71),
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
      // body: Column(children: [
      //   SizedBox(
      //     height: 20,
      //   ),
      //   myTextView("$batch_name"),
      //   // SingleChildScrollView(
      //   //   child: Container(
      //   //     height: MediaQuery.of(context).size.height * 0.6,
      //   //     child: Column(
      //   //       children: [
      //   //         const Expanded(
      //   //           child: ListStudentScreen(),
      //   //         ),
      //   //         const SizedBox(
      //   //           height: 20,
      //   //         ),
      //   //         MyElevatedButton(
      //   //           text: 'Add New Student',
      //   //           onPressed: () {
      //   //             Navigator.push(
      //   //               context,
      //   //               MaterialPageRoute(
      //   //                   builder: (context) =>
      //   //                       AddStudentScreen(batch_name: batch_name)),
      //   //             );
      //   //           },
      //   //         ),
      //   //       ],
      //   //     ),
      //   //   ),
      //   // ),
      // ]),
    );
  }
}
