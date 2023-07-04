import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../db/student_db/studentdb.dart';
import '../../models/StudentModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Generating a long list to fill the ListView
  final List<Map> data = List.generate(
      20, (index) => {'id': index, 'name': 'Item $index', 'isSelected': false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder: (context, List<StudentModel> studentList, Widget? _) {
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
                        // leading: CircleAvatar(
                        //     backgroundColor: Colors.white,
                        //     child: Text(data.id.toString())),
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
      ),
    );
  }
}
