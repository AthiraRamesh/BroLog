import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import '../../models/attendance_model.dart';

const STUDENT_DB_NAME = 'attendance_db';

abstract class StudentDbFunctions {
  Future<List<attendance_model>> getallstudents();
  Future<void> addAttendance(attendance_model obj);
  Future<void> deleteAttendance(int id);
}

ValueNotifier<List<attendance_model>> attendanceListNotifier =
    ValueNotifier([]);

Future<void> addAttendance(attendance_model value) async {
  final attendanceDB = await Hive.openBox<attendance_model>('attendance_db');
  //final attendance = attendance_model(absent: absent);
  // //print("inside attendance_db");
  //print(absent);
  await attendanceDB.add(value);
  // print(attendance.toString());
  // print(attendanceDB.toString());
  // await attendanceDB.add(value);
  //log(attendance.toString());
  // //print(value);
  attendanceListNotifier.notifyListeners();
}

Future<void> getallattendance(String batch_name) async {
  final attendanceDB = await Hive.openBox<attendance_model>('attendance_db');
  //print(attendanceDB.length);
  attendanceListNotifier.value.clear();

  attendanceListNotifier.value.addAll(attendanceDB.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  attendanceListNotifier.notifyListeners();
}
