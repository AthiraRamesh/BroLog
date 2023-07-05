import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../db/student_db/studentdb.dart';
import '../../models/StudentModel.dart';

class ListAttendanceScreen extends StatefulWidget {
  const ListAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<ListAttendanceScreen> createState() => _ListAttendanceScreenState();
}

class _ListAttendanceScreenState extends State<ListAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (context, List<StudentModel> studentList, Widget? _) {
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
                      onTap: () {
                        setState(() {
                          data.isSelected = !data.isSelected;
                          //data['isSelected'] = !data['isSelected'];
                        });
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
