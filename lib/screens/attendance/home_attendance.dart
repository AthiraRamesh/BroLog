import 'package:Brolog/db/student_db/studentdb.dart';
import 'package:flutter/material.dart';
import '../../models/student_model.dart';
import 'date_attendance.dart';

class HomeAttendanceScreen extends StatefulWidget {
  final String batch_name;
  final DateTime selected_date;
  HomeAttendanceScreen({
    super.key,
    required this.batch_name,
    required this.selected_date,
  });

  @override
  State<HomeAttendanceScreen> createState() => _HomeAttendanceScreenState();
}

final _dateController = TextEditingController();

class _HomeAttendanceScreenState extends State<HomeAttendanceScreen> {
  //DateTime date = DateTime(2023, 07, 06);
  List<dynamic> absent = [];
  @override
  Widget build(BuildContext context) {
    //DateTime selected_date = widget.selected_date;
    String batch_name = widget.batch_name;
    getallstudents(batch_name);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("$batch_name : Attendance"),
          actions: [
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title: const Text(
                        'Save!',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      content: const Text(
                        "Do you want to save this attendance",
                      ),
                      actions: [
                        TextButton(
                          onPressed: (() {
                            onAttendanceAddButtonClick();
                            //popoutfuction(context);
                            //deleteBatch(widget.index);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DateAttendanceScreen(
                                      batch_name: batch_name);
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(20),
                                content:
                                    Text("Attendance saved successfully !!"),
                              ),
                            );
                          }),
                          child: const Text('Save'),
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
          ],
        ),
        body: ValueListenableBuilder(
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
        ));
  }

  popoutfuction(BuildContext context) {
    return Navigator.pop(context);
  }

  Future<void> onAttendanceAddButtonClick() async {}
}
