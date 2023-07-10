import 'package:flutter/material.dart';
import './screens/welcome.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import './screens/batch/home.dart';
import 'models/attendance_model.dart';
import 'models/student_model.dart';
import 'models/batch_model.dart';

void main() async {
  //hive
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(batchmodelAdapter());
  Hive.registerAdapter(studentmodelAdapter());
  Hive.registerAdapter(attendancemodelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BroLog',
      routes: {
        '/home': (context) => const HomeScreen(),

        //named routing
      },
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const WelcomeScreen(),
    );
  }
}
