import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import '../../models/attendance_model.dart';

const STUDENT_DB_NAME = 'student_db';

abstract class StudentDbFunctions {
  Future<List<attendance_model>> getallstudents();
  Future<void> addAttendance(attendance_model obj);
  Future<void> deleteAttendance(int id);
}

ValueNotifier<List<attendance_model>> attendanceListNotifier =
    ValueNotifier([]);
Future<void> addAttendance(List<dynamic> absent) async {
  final attendanceDB = await Hive.openBox<attendance_model>('attendance_db');
  final attendance = attendance_model(absent: absent);
  print("inside attendance_db");
  print(absent);
  attendanceDB.add(attendance);
  // await attendanceDB.add(value);
  log(attendance.toString());
  attendanceListNotifier.notifyListeners();
}
