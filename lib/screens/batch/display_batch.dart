import 'package:flutter/material.dart';
import '../../widgets/TextHeading.dart';
import '../../widgets/Text.dart';
import '../../widgets/ImageWidgets/Bubbles_image.dart';
import '../../widgets/ImageWidgets/Attendance_image.dart';
import '../../widgets/ElevatedButton.dart';
import '../../db/batch_db/batchdb.dart';
import '../../screens/student/home_student.dart';
import 'edit_batch.dart';

class DisplayBatch extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeStudentScreen(
                        batch_name: batch_name,
                      )),
            );
            // Add the navigation logic to go back to the previous page
          },
        ),
        centerTitle: true,
        title: Text("Batch Details"),
      ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Batch Details"),
      // ),
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
                    return EditBatch(
                      batch_name: batch_name,
                      location: location,
                      count: count,
                      lead_name: lead_name,
                      phnNumber: phnNumber,
                      index: index,
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
                    myTextView("Batch Details "),
                    const SizedBox(
                      height: 30,
                    ),
                    myText("Batch Name: $batch_name"),
                    const SizedBox(
                      height: 20,
                    ),
                    myText("Location: $location"),
                    const SizedBox(
                      height: 20,
                    ),
                    myText("Number of students: $count"),
                    const SizedBox(
                      height: 30,
                    ),
                    myTextView("Batch Leader\'s Details "),
                    const SizedBox(
                      height: 30,
                    ),
                    myText("Name: $lead_name"),
                    const SizedBox(
                      height: 20,
                    ),
                    myText("Mobile Number: $phnNumber"),
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
                    builder: (context) =>
                        HomeStudentScreen(batch_name: '$batch_name')),
              );
            },
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          // AttendanceImageWidget(),
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
