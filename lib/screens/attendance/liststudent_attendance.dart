import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../db/attendance_db/attendancedb.dart';
import '../../db/student_db/studentdb.dart';
import '../../models/student_model.dart';
import '../../models/attendance_model.dart';

class ListAttendanceScreen extends StatefulWidget {
  const ListAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<ListAttendanceScreen> createState() => _ListAttendanceScreenState();
}

class _ListAttendanceScreenState extends State<ListAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: attendanceListNotifier,
      builder: (context, List<attendance_model> attendanceList, Widget? _) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = attendanceList[index];
            //String count = 'O';
            DateTime now = data.date;
            String formattedDate =
                DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
            //print(data);
            return Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 60.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color.fromARGB(255, 216, 214, 214),
                    ),
                    child: ListTile(
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title: const Text(
                                  'Delete!',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                content: const Text(
                                  "Do you want to delete this attendance",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: (() {
                                      popoutfuction(context);
                                      //deleteBatch(widget.index);

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          margin: EdgeInsets.all(20),
                                          content: Text(
                                              "Attendance delete successfully !!"),
                                        ),
                                      );
                                    }),
                                    child: const Text('Delete'),
                                  ),
                                  TextButton(
                                      onPressed: (() {
                                        popoutfuction(context);
                                      }),
                                      child: const Text('Cancel'))
                                ],
                              );
                            }),
                          );
                          // Handle search icon press
                        },
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        // child: Text(
                        //   count,
                        //   //data.student_name.toString(),
                        //   style: TextStyle(
                        //     fontSize: 16, // Set the desired font size
                        //     fontWeight:
                        //         FontWeight.bold, // Set the desired font weight
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ),

                      title: Center(
                        child: Text(
                          formattedDate,
                          //data.student_name.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      //trailing: Text(data.domain),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: attendanceList.length,
        );
      },
    );
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
    //return Navigator.pop(context);
    //return Navigator.pushNamed(context, '/home');
  }
}
