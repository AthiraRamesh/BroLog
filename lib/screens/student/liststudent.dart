import 'package:Brolog/db/batch_db/batchdb.dart';
import 'package:flutter/material.dart';
import '../../db/models/StudentModel.dart';
import 'display_student.dart';

class ListStudentScreen extends StatelessWidget {
  //final String batch_name;
  const ListStudentScreen({
    super.key,
    //required this.batch_name,
  });

  @override
  Widget build(BuildContext context) {
    //print('@list_student page Batch Name: $batch_name');
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (context, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = studentList[index];
            return Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 80.0),
              child: Container(
                //Text('Received String: $stringValue'),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: const Color.fromARGB(255, 232, 229, 229),
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      data.student_name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(30.0),
                  //   side: BorderSide(color: Colors.grey),
                  // ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return DisplayStudent(
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
