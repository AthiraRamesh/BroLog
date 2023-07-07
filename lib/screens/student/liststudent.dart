import 'package:flutter/material.dart';
import '../../models/student_model.dart';
import '../../db/student_db/studentdb.dart';
import 'display_student.dart';

class ListStudentScreen extends StatelessWidget {
  const ListStudentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (context, List<student_model> studentList, Widget? _) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = studentList[index];
            return Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 80.0),
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
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Text(
                          data.register_number.toString(),
                          style: TextStyle(
                            fontSize: 16, // Set the desired font size
                            fontWeight:
                                FontWeight.bold, // Set the desired font weight
                            color: Colors.white,
                          ),
                        ),
                      ),
                      title: Center(
                        child: Text(
                          data.student_name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      //trailing: Text(data.domain),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              return DisplayStudent(
                                register_number: data.register_number,
                                student_name: data.student_name,
                                domain: data.domain,
                                mobile: data.mobile,
                                email_id: data.email_id,
                                gender: data.gender,
                                index: index,
                                batch_name: data.batch_name,
                              );
                            }),
                          ),
                        );
                      },
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
          itemCount: studentList.length,
        );
      },
    );
  }
}
