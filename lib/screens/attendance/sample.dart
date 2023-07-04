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
        ),
        body: SafeArea(
            child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext ctx, index) {
            return Card(
                key: ValueKey(data[index]['name']),
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),

                // The color depends on this is selected or not
                color: data[index]['isSelected'] == true
                    ? Color.fromARGB(255, 213, 71, 71)
                    : Color.fromARGB(255, 117, 198, 120),
                child: ListTile(
                  onTap: () {
                    // if this item isn't selected yet, "isSelected": false -> true
                    // If this item already is selected: "isSelected": true -> false
                    setState(() {
                      data[index]['isSelected'] = !data[index]['isSelected'];
                    });
                  },
                  leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 224, 221, 221),
                      child: Text(data[index]['id'].toString())),
                  title: Text(data[index]['name']),
                ));
          },
        ))
);
  }
}
