import 'package:flutter/material.dart';
import '../../db/student_db/studentdb.dart';
import '../../models/student_model.dart';

class ListAttendanceScreen extends StatefulWidget {
  const ListAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<ListAttendanceScreen> createState() => _ListAttendanceScreenState();
}

class _ListAttendanceScreenState extends State<ListAttendanceScreen> {
  //List<dynamic> present = [];
  List<dynamic> absent = [];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (context, List<student_model> studentList, Widget? _) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final data = studentList[index];
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
                            fontWeight:
                                FontWeight.bold, // Set the desired font weight
                            color: Colors.black,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          data.isSelected = !data.isSelected;
                          print(data.isSelected);

                          //print(attendance_list);

                          if (data.isSelected == true) {
                            absent.add(data.student_name);
                          } else if (data.isSelected == false) {
                            absent.remove(data.student_name);
                          }
                        });
                        print("absent");
                        print(absent);
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
    );
  }
}
