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
      appBar: AppBar(
        centerTitle: true,
        title: Text("Batches"),
        automaticallyImplyLeading: false,
      ),
      body: const ListBatchScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddBatchScreen();
              },
            ),
          );
        },
        tooltip: 'Add batches',
        backgroundColor: Color.fromARGB(255, 213, 71, 71),
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
