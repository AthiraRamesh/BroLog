// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore_for_file: invalid_use_of_visible_for_testing_member, duplicate_ignore

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import '../../models/AttendanceModel.dart';

const STUDENT_DB_NAME = 'student_db';

abstract class StudentDbFunctions {
  Future<List<AttendanceModel>> getallstudents();
  Future<void> addAttendance(AttendanceModel obj);
  Future<void> deleteAttendance(int id);
}

// ignore: duplicate_ignore, duplicate_ignore
ValueNotifier<List<AttendanceModel>> studentListNotifier = ValueNotifier([]);
Future<void> addStudent(AttendanceModel value) async {
  final attendanceDB = await Hive.openBox<AttendanceModel>('student_db');
  await attendanceDB.add(value);
  //await attendanceDB.put(value.id, value);
  log(value.toString());

  // studentListNotifier.value.add(value);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  studentListNotifier.notifyListeners();
}

// Future<List<StudentModel>> getallstudents(String batch_name) async {
//   final attendanceDB = await Hive.openBox<StudentModel>('student_db');
//   final studentList = attendanceDB.values.toList();
//   final filteredList =
//       studentList.where((student) => student.batch_name == batch_name).toList();
//   //studentList.sort((a, b) => a.batch_name.compareTo(b.batch_name));
//   // studentList.sort((a, b) => a.student_name.compareTo(b.student_name));
//   studentListNotifier.value.addAll(filteredList);
//   filteredList.sort();
//   // ignore: invalid_use_of_protected_member
//   studentListNotifier.notifyListeners();
//   return studentList;
// }

// Future<void> getallstudents(String batch_name) async {
//   final attendanceDB = await Hive.openBox<AttendanceModel>('student_db');
//   //print(attendanceDB.length);
//   studentListNotifier.value.clear();
//   //print(studentListNotifier.value.length);
//   final studentList = attendanceDB.values.toList();
//   final filteredList =
//       studentList.where((student) => student.batch_name == batch_name).toList();
//   filteredList
//       .sort((a, b) => a.student_name.compareTo(b.student_name)); //sorting

//   studentListNotifier.value.addAll(filteredList);
//   studentListNotifier.notifyListeners();
// }

// Future<void> getallstudents(String batch_name) async {
//   final attendanceDB = await Hive.openBox<StudentModel>('student_db');
//   //print(attendanceDB.length);
//   studentListNotifier.value.clear();
//   //print(studentListNotifier.value.length);
//   studentListNotifier.value.addAll(attendanceDB.values);
//   studentListNotifier.notifyListeners();
// }

Future<void> deleteStudent(int id) async {
  final attendanceDB = await Hive.openBox<AttendanceModel>('student_db');

  await attendanceDB.deleteAt(id);
  // getallstudents(batch_name);
}

// Future<void> editStudentList(int id, StudentModel value) async {
//   final attendanceDB = await Hive.openBox<StudentModel>('student_db');
//   attendanceDB.putAt(id, value);
//   getallstudents();
// }
