import 'package:flutter/material.dart';
import '../../widgets/TextHeading.dart';
import '../../widgets/ImageWidgets/Attendance_image.dart';
import '../../widgets/ImageWidgets/Bubbles_image.dart';
import './addbatch.dart';
import './listbatch.dart';
import '../../widgets/FloatingActionButton.dart';
import '../../db/batch_db/batchdb.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    getallbatches();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        BubblesImageWidget(),
        // const SizedBox(
        //   height: 20,
        // ),
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            //width: MediaQuery.of(context).size.width * 0.01,
            child: Column(
              children: [
                myTextView("Batches"),
                // const SizedBox(
                //   height: 20,
                // ),
                const Expanded(child: ListBatchScreen()),
                const SizedBox(
                  height: 20,
                ),
                MyFloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddBatchScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AttendanceImageWidget(),
      ]),
    );
  }
}
