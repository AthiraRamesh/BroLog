import 'package:flutter/material.dart';
import '../../widgets/Text.dart';
import 'edit_student.dart';

class DisplayStudent extends StatelessWidget {
  final String student_name;
  final String domain;
  final String mobile;
  final String email_id;
  final String gender;
  final int index;
  final String batch_name;
  const DisplayStudent({
    super.key,
    required this.student_name,
    required this.domain,
    required this.mobile,
    required this.email_id,
    required this.gender,
    required this.index,
    required this.batch_name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("$batch_name : Student Details"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) {
                    return EditStudent(
                      student_name: student_name,
                      domain: domain,
                      mobile: mobile,
                      email_id: email_id,
                      gender: gender,
                      index: index,
                      batch_name: batch_name,
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

                                //deleteStudent(widget.index);

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
                  Icons.delete_outline,
                  size: 25,
                  color: Color.fromARGB(255, 213, 71, 71),
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
                    const SizedBox(
                      height: 30,
                    ),
                    myText("Name -  $student_name"),
                    const SizedBox(
                      height: 20,
                    ),
                    myText("Domain -  $domain"),
                    const SizedBox(
                      height: 30,
                    ),
                    myText("Mobile -  $mobile"),
                    const SizedBox(
                      height: 30,
                    ),
                    myText("Email -  $email_id"),
                    const SizedBox(
                      height: 20,
                    ),
                    myText("Gender -  $gender"),
                  ],
                ),
              ),
            ),
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
