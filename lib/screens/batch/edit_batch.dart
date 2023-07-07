import 'package:flutter/material.dart';
import '../../models/batch_model.dart';
import '../../db/batch_db/batchdb.dart';
import '../../widgets/TextField.dart';
import '../../widgets/TextHeading.dart';
import '../../widgets/ElevatedButton.dart';
import 'home.dart';

class EditBatch extends StatefulWidget {
  final String batch_name;
  final String location;
  final String count;
  final String lead_name;
  final String phnNumber;
  final int index;

  const EditBatch({
    super.key,
    required this.batch_name,
    required this.location,
    required this.count,
    required this.lead_name,
    required this.phnNumber,
    required this.index,
  });

  @override
  State<EditBatch> createState() => _EditBatchState();
}

class _EditBatchState extends State<EditBatch> {
  TextEditingController _nameOfBatch = TextEditingController();
  TextEditingController _locationOfBatch = TextEditingController();
  TextEditingController _CountOfStudent = TextEditingController();
  TextEditingController _nameOfLead = TextEditingController();
  TextEditingController _phnOfLead = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameOfBatch = TextEditingController(text: widget.batch_name);
    _locationOfBatch = TextEditingController(text: widget.location);
    _CountOfStudent = TextEditingController(text: widget.count);
    _nameOfLead = TextEditingController(text: widget.lead_name);
    _phnOfLead = TextEditingController(text: widget.phnNumber);
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
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            MyTextFormField(
              controller: _nameOfBatch,
              labelText: 'Batch name',
              hintText: 'Enter batch name',
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextFormField(
              controller: _locationOfBatch,
              labelText: 'Location',
              hintText: 'Enter location',
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextFormField(
              controller: _CountOfStudent,
              labelText: 'Enrollment',
              hintText: 'Enter number of students',
            ),
            const SizedBox(
              height: 20,
            ),
            myTextView("Batch Leader Details"),
            const SizedBox(
              height: 20,
            ),
            MyTextFormField(
              controller: _nameOfLead,
              labelText: 'Name',
              hintText: 'Enter Batch Leader\'s name',
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextFormField(
              controller: _phnOfLead,
              labelText: 'Mobile Number',
              hintText: 'Enter Batch Leader\'s phone number',
            ),
            const SizedBox(
              height: 20,
            ),
            MyElevatedButton(
              text: 'Save',
              onPressed: () {
                onEditSaveButton(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            // AttendanceImageWidget(),
          ],
        ),
      ),
    );
  }

  Future<void> onEditSaveButton(ctx) async {
    final batchmodel = batch_model(
      batch_name: _nameOfBatch.text,
      location: _locationOfBatch.text,
      count: _CountOfStudent.text,
      lead_name: _nameOfLead.text,
      phnNumber: _phnOfLead.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(30),
        backgroundColor: Colors.black,
        content: Text(
          'Edited',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
    editBatchList(widget.index, batchmodel);
  }
}
