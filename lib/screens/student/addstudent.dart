import 'package:Brolog/db/student_db/studentdb.dart';
import 'package:flutter/material.dart';
import '../../widgets/TextHeading.dart';
import '../../widgets/ImageWidgets/Attendance_image.dart';
import '../../widgets/ImageWidgets/Bubbles_image.dart';
import '../../widgets/ElevatedButton.dart';
import '../../widgets/TextField.dart';
import '../../db/models/StudentModel.dart';
import '../../db/batch_db/batchdb.dart';
import './home_student.dart';
import '../../db/models/BatchModel.dart';

class AddStudentScreen extends StatefulWidget {
  final String batch_name;
  AddStudentScreen({
    super.key,
    required this.batch_name,
  });
  //static final Color buttonColor = Color(1BB6B6);
  @override
  State<AddStudentScreen> createState() => _AddBatchScreenState();
}

class _AddBatchScreenState extends State<AddStudentScreen> {
  //final TextEditingController myController = TextEditingController();
  final _nameOfStudent = TextEditingController();
  final _domain = TextEditingController();
  final _mobile = TextEditingController();
  final _gender = TextEditingController();
  final _email = TextEditingController();
  //final _batch = TextEditingController();

  // final _batchId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);
    String batch_name = widget.batch_name;
    print('@addstudent page Batch Name: $batch_name');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          BubblesImageWidget(),
          // const SizedBox(
          //   height: 5,
          // ),
          myTextView("Enter Student Details"),
          const SizedBox(
            height: 20,
          ),
          myTextView("$batch_name"),
          // MyTextFormField(
          //   controller: _batchId,
          //   labelText: 'Batch name',
          //   hintText: 'Enter batch name',
          // ),
          const SizedBox(
            height: 20,
          ),
          MyTextFormField(
            controller: _nameOfStudent,
            labelText: 'Name',
            hintText: 'Enter student name',
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextFormField(
            controller: _domain,
            labelText: 'Domain',
            hintText: 'Enter domain',
          ),
          const SizedBox(
            height: 20,
          ),

          MyTextFormField(
            controller: _mobile,
            labelText: 'Mobile Number',
            hintText: 'Enter Mobile Number',
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextFormField(
            controller: _gender,
            labelText: 'Gender',
            hintText: 'Enter Gender',
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextFormField(
            controller: _email,
            labelText: 'Email id',
            hintText: 'Enter Email id',
          ),
          const SizedBox(
            height: 20,
          ),
          MyElevatedButton(
            text: 'Save',
            onPressed: () {
              onBatchAddButtonClick();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeStudentScreen(
                          batch_name: batch_name,
                        )),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AttendanceImageWidget(),
        ]),
      ),
    );
  }

  Future<void> onBatchAddButtonClick() async {
    final StudentName = _nameOfStudent.text.trim();
    final Domain = _domain.text.trim();
    final Mobile = _mobile.text.trim();
    final Gender = _gender.text.trim();
    final Email = _email.text.trim();
    //final Batch_name = widget.batch_name;
    final String batch_name = widget.batch_name;
    print('Batch Name: $batch_name');

    if (StudentName.isEmpty ||
        Domain.isEmpty ||
        Mobile.isEmpty ||
        Gender.isEmpty ||
        Email.isEmpty) {
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
          content: Text(
            'Student Added Successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
    //print('@Home_student page Batch Name: $batch_name');

    final student = StudentModel(
      student_name: StudentName,
      domain: Domain,
      mobile: Mobile,
      email_id: Email,
      gender: Gender,
      batch_name: batch_name,
    );

    addStudent(student);
  }
}
