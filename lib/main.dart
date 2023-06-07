import 'package:flutter/material.dart';
import './screens/login.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import './screens/batch/home.dart';
import 'db/models/BatchModel.dart';
import 'db/models/StudentModel.dart';

void main() async {
  //hive
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(BatchModelAdapter());
  Hive.registerAdapter(StudentModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brolog',
      routes: {
        '/home': (context) => const HomeScreen(),
        //named routing
      },
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginScreen(),
    );
  }
}
