import 'package:Brolog/screens/attendance/date_attendance.dart';
import 'package:flutter/material.dart';
import '../../widgets/TextHeading.dart';
import '../../widgets/Text.dart';
import '../../widgets/ElevatedButton.dart';
import '../../db/batch_db/batchdb.dart';
import '../../screens/student/home_student.dart';
import 'edit_batch.dart';

class DisplayBatch extends StatefulWidget {
  final String batch_name;
  final String location;
  final String count;
  final String lead_name;
  final String phnNumber;
  final int index;
  const DisplayBatch({
    super.key,
    required this.batch_name,
    required this.location,
    required this.count,
    required this.lead_name,
    required this.phnNumber,
    required this.index,
  });

  @override
  State<DisplayBatch> createState() => _DisplayBatchState();
}

class _DisplayBatchState extends State<DisplayBatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Batch Details"),
      ),
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => HomeStudentScreen(
      //                   batch_name: widget.batch_name,
      //                 )),
      //       );
      //       // Add the navigation logic to go back to the previous page
      //     },
      //   ),
      //   centerTitle: true,
      //   title: Text("Batch Details"),
      // ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) {
                    return EditBatch(
                      batch_name: widget.batch_name,
                      location: widget.location,
                      count: widget.count,
                      lead_name: widget.lead_name,
                      phnNumber: widget.phnNumber,
                      index: widget.index,
                    );
                  })));
                },
                icon: Icon(
                  Icons.edit_outlined,
                  size: 25,
                  color: Colors.blueGrey,
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
                                deleteBatch(widget.index);

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
                icon: Icon(Icons.delete_outline,
                    size: 25, color: Color.fromARGB(255, 213, 71, 71)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myText("Batch Name -  ${widget.batch_name}"),
                const SizedBox(
                  height: 20,
                ),
                myText("Location -  ${widget.location}"),
                const SizedBox(
                  height: 20,
                ),
                myText("Number of students -  ${widget.count}"),
                const SizedBox(
                  height: 30,
                ),
                myTextView("Batch Leader\'s Details "),
                const SizedBox(
                  height: 30,
                ),
                myText("Name -  ${widget.lead_name}"),
                const SizedBox(
                  height: 20,
                ),
                myText("Mobile Number - ${widget.phnNumber}"),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          // MyElevatedButton(
          //   text: 'Take Attendance',
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => HomeAttendanceScreen(
          //               batch_name: '${widget.batch_name}')),
          //     );
          //   },
          // ),
          // MyElevatedButton(
          //   text: 'Attendance',
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => HomeAttendanceScreen(
          //               batch_name: '${widget.batch_name}')),
          //     );
          //   },
          // ),
          const SizedBox(
            height: 30,
          ),
          MyElevatedButton(
            text: 'Students Details',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HomeStudentScreen(batch_name: '${widget.batch_name}')),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          MyElevatedButton(
            text: 'Attendance',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DateAttendanceScreen(
                        batch_name: '${widget.batch_name}')),
              );
            },
          ),
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
