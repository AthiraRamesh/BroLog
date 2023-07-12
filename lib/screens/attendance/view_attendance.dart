import 'package:Brolog/db/student_db/studentdb.dart';
import 'package:flutter/material.dart';
import '../../db/attendance_db/attendancedb.dart';
import 'liststudent_attendance.dart';

class ViewAttendanceScreen extends StatefulWidget {
  final String batch_name;
  const ViewAttendanceScreen({
    super.key,
    required this.batch_name,
  });

  @override
  State<ViewAttendanceScreen> createState() => _ViewAttendanceScreenState();
}

class _ViewAttendanceScreenState extends State<ViewAttendanceScreen> {
  DateTime date = DateTime(2023, 07, 07);
  @override
  Widget build(BuildContext context) {
    String batch_name = widget.batch_name;
    getallattendance(batch_name);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        //title: Text("$batch_name : View Attendance"),
        title: Text(
          "View Attendance",
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.delete),
        //     onPressed: () {
        //       showDialog(
        //         context: context,
        //         builder: ((context) {
        //           return Padding(
        //             padding: const EdgeInsets.all(20.0),
        //             child: AlertDialog(
        //               title: const Text(
        //                 'Delete!',
        //                 style: TextStyle(
        //                   color: Colors.red,
        //                 ),
        //               ),
        //               content: const Text(
        //                 "Do you want to delete this attendance",
        //               ),
        //               actions: [
        //                 TextButton(
        //                   onPressed: (() {
        //                     popoutfuction(context);
        //                     //deleteBatch(widget.index);

        //                     ScaffoldMessenger.of(context).showSnackBar(
        //                       const SnackBar(
        //                         behavior: SnackBarBehavior.floating,
        //                         margin: EdgeInsets.all(20),
        //                         content:
        //                             Text("Attendance delete successfully !!"),
        //                       ),
        //                     );
        //                   }),
        //                   child: const Text('Delete'),
        //                 ),
        //                 TextButton(
        //                     onPressed: (() {
        //                       popoutfuction(context);
        //                     }),
        //                     child: const Text('Cancel'))
        //               ],
        //             ),
        //           );
        //         }),
        //       );
        //       // Handle search icon press
        //     },
        //   ),
        // ],
      ),
      body: const ListAttendanceScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return AddStudentScreen(batch_name: batch_name);
          //     },
          //   ),
          // );
        },
        tooltip: 'Edit Attendance',
        backgroundColor: Color.fromARGB(255, 213, 71, 71),
        child: const Icon(
          //Icons.article_outlined,
          Icons.edit_note_rounded,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
    //return Navigator.pop(context);
    //return Navigator.pushNamed(context, '/home');
  }
}
