import 'package:flutter/material.dart';
import '../../widgets/TextField.dart';

class EditStudent extends StatefulWidget {
  final String register_number;
  final String student_name;
  final String domain;
  final String mobile;
  final String email_id;
  final String gender;
  final int index;
  final String batch_name;

  const EditStudent({
    super.key,
    required this.register_number,
    required this.student_name,
    required this.domain,
    required this.mobile,
    required this.email_id,
    required this.gender,
    required this.index,
    required this.batch_name,
  });

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  TextEditingController _register = TextEditingController();
  TextEditingController _nameOfStudent = TextEditingController();
  TextEditingController _domain = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  void initState() {
    super.initState();
    //_register = TextEditingController(text: widget.register_number);
    _nameOfStudent = TextEditingController(text: widget.student_name);
    _domain = TextEditingController(text: widget.domain);
    _mobile = TextEditingController(text: widget.mobile);
    _gender = TextEditingController(text: widget.gender);
    _email = TextEditingController(text: widget.email_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Batch Details"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          MyTextFormField(
            controller: _register,
            labelText: 'Register Number',
            hintText: 'Enter register number',
          ),
          const SizedBox(
            height: 20,
          ),

          MyTextFormField(
            controller: _nameOfStudent,
            labelText: 'Student name',
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
          // MyElevatedButton(
          //   text: 'Save',
          //   onPressed: () {
          //     onStudenAddButtonClick();
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => HomeStudentScreen(
          //                 batch_name: batch_name,
          //               )),
          //     );
          //   },
          // ),
        ]),
      ),
    );
  }

  // Future<void> onEditSaveButton(ctx) async {
  //   final batchmodel = BatchModel(
  //     batch_name: _nameOfBatch.text,
  //     location: _locationOfBatch.text,
  //     count: _CountOfStudent.text,
  //     lead_name: _nameOfLead.text,
  //     phnNumber: _phnOfLead.text,
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       duration: Duration(seconds: 1),
  //       behavior: SnackBarBehavior.floating,
  //       margin: EdgeInsets.all(30),
  //       backgroundColor: Colors.black,
  //       content: Text(
  //         'Edited',
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   );
  //   editBatchList(widget.index, batchmodel);
  // }
}
