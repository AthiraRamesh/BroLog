import 'package:Brolog/db/student_db/studentdb.dart';
import 'package:Brolog/models/attendance_model.dart';
import 'package:flutter/material.dart';
import '../../db/attendance_db/attendancedb.dart';
import '../../models/student_model.dart';
import 'date_attendance.dart';
import 'grah_attendance.dart';

class HomeAttendanceScreen extends StatefulWidget {
  final String batch_name;
  final DateTime selected_date;
  final bool isSelected;
  final String count;
  HomeAttendanceScreen({
    super.key,
    required this.batch_name,
    required this.selected_date,
    this.isSelected = false,
    required this.count,
  });

  @override
  State<HomeAttendanceScreen> createState() => _HomeAttendanceScreenState();
}

final _dateController = TextEditingController();

class _HomeAttendanceScreenState extends State<HomeAttendanceScreen> {
  String? _Student_name;
  List<String> absent = [];
  List<String> present = [];
  //List<String> present = [];
  @override
  Widget build(BuildContext context) {
    String batch_name = widget.batch_name;
    getallstudents(batch_name);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("$batch_name : Attendance"),
      ),
      body: ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder: (context, List<student_model> studentList, Widget? _) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final data = studentList[index];

              List<String> names = [];

              for (var student in studentList) {
                names.add(student.student_name);
              }
              //print("names=${present}");
              //print("names=${present.length}");
              present = names;
              //print("names=${names}");
              return Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Card(
                      // The color depends on this is selected or not
                      color: data.isSelected == true
                          ? Color.fromARGB(255, 213, 71, 71)
                          : Color.fromARGB(255, 117, 198, 120),
                      margin: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            data.register_number,
                            style: TextStyle(
                              fontSize: 16, // Set the desired font size
                              fontWeight: FontWeight
                                  .bold, // Set the desired font weight
                              color: Colors.black,
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            data.isSelected = !data.isSelected;
                            print(data.isSelected);
                            if (data.isSelected == true) {
                              //red

                              absent.add(data.student_name);
                              present.remove(data.student_name);
                            } else if (data.isSelected == false) {
                              //green
                              absent.remove(data.student_name);
                              present.add(data.student_name);
                            }
                          });
                          print("absent${absent}");
                          print("present${present}");
                        },
                        title: Center(
                          child: Text(
                            data.student_name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              );
            },
            itemCount: studentList.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return GraphAttendanceScreen(list: absent, count: count);
          //     },
          //   ),
          // );
        },
        tooltip: 'Save Attendance ',
        backgroundColor: Colors.teal,
        child: const Icon(
          Icons.check,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  popoutfuction(BuildContext context) {
    return Navigator.pop(context);
  }

  Future<void> onAttendanceAddButtonClick() async {
    print("inside onAttendanceAddButtonClick");
    print(_Student_name);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(20),
        content: Text("onAttendanceAddButtonClick!"),
      ),
    );
    DateTime selected_date = widget.selected_date;
    // final Register_number = ;
    // final Student_name = _;
    // final isSelected = ;

    final attendance = attendance_model(
      date: selected_date,
    );
    addAttendance(attendance);
  }
}
