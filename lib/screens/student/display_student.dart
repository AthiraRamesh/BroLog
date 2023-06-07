import 'package:flutter/material.dart';
import '../../widgets/TextHeading.dart';
import '../../widgets/Text.dart';
import '../../widgets/ImageWidgets/Bubbles_image.dart';
import '../../widgets/ImageWidgets/Attendance_image.dart';
import '../../widgets/ElevatedButton.dart';
import '../../db/batch_db/batchdb.dart';

import './home_student.dart';
import '../../db/models/BatchModel.dart';

class DisplayStudent extends StatelessWidget {
  final String student_name;
  final String domain;
  final String mobile;
  final String email_id;
  final String gender;
  final int index;
  //final String batch_name;
  final String batch_name;
  const DisplayStudent({
    super.key,
    required this.student_name,
    required this.domain,
    required this.mobile,
    required this.email_id,
    required this.gender,
    required this.index,
    required this.batch_name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          BubblesImageWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) {
                    return DisplayStudent(
                      student_name: student_name,
                      domain: domain,
                      mobile: mobile,
                      email_id: email_id,
                      gender: gender,
                      index: index,
                      batch_name: batch_name,
                    );
                  })));
                },
                icon: Icon(
                  Icons.edit,
                  size: 25,
                  color: Colors.teal,
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: ((context) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: AlertDialog(
                          title: const Text(
                            'Alert!',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          content: const Text(
                            "Do you want to delete this student",
                          ),
                          actions: [
                            TextButton(
                              onPressed: (() {
                                popoutfuction(context);
                                deleteBatch(index);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.all(20),
                                    content: Text("Deleted"),
                                  ),
                                );
                              }),
                              child: const Text('Yes'),
                            ),
                            TextButton(
                                onPressed: (() {
                                  popoutfuction(context);
                                }),
                                child: const Text('No'))
                          ],
                        ),
                      );
                    }),
                  );
                },
                icon: Icon(
                  Icons.delete,
                  size: 25,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myTextView("Student Details "),
                    const SizedBox(
                      height: 30,
                    ),
                    myText("Batch Name:"),
                    const SizedBox(
                      height: 20,
                    ),
                    myText("Name: $student_name"),
                    const SizedBox(
                      height: 20,
                    ),
                    myText("Domain: $domain"),
                    const SizedBox(
                      height: 30,
                    ),
                    myTextView("Mobile: $mobile"),
                    const SizedBox(
                      height: 30,
                    ),
                    myText("Email id: $email_id"),
                    const SizedBox(
                      height: 20,
                    ),
                    myText("Gender: $gender"),
                  ],
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          MyElevatedButton(
            text: 'Attendance',
            onPressed: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          MyElevatedButton(
            text: 'Students Details',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeStudentScreen(batch_name: '')),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AttendanceImageWidget(),
        ],
      ),
    );
  }

  popoutfuction(BuildContext context) {
    //return Navigator.of(context).pop();
    //return Navigator.pop(context);
    return Navigator.pushNamed(context, '/home');
  }
}
