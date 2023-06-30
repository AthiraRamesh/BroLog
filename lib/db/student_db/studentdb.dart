// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore_for_file: invalid_use_of_visible_for_testing_member, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import '../../models/StudentModel.dart';
import 'dart:developer';

abstract class StudentDbFunctions {
  Future<List<StudentModel>> getallstudents();
  Future<void> addStudent(StudentModel obj);
  Future<void> deleteStudent(int id);
}

// class StudentDB implements StudentDbFunctions {
//   StudentDB._internal();
//   static StudentDB instance = StudentDB._internal();
//   factory StudentDB() {
//     return instance;
//   }

//   @override
//   Future<void> addStudent(StudentModel obj) => throw UnimplementedError();

//   @override
//   Future<void> deleteStudent(int id) => throw UnimplementedError();

//   @override
//   Future<List<StudentModel>> getallstudents() => throw UnimplementedError();
// }

const STUDENT_DB_NAME = 'student_db';
ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
// ignore: duplicate_ignore, duplicate_ignore
Future<void> addStudent(StudentModel value) async {
  final attendanceDB = await Hive.openBox<StudentModel>('student_db');
  await attendanceDB.add(value);
  //await attendanceDB.put(value.id, value);
  log(value.toString());

  // studentListNotifier.value.add(value);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  studentListNotifier.notifyListeners();
}

Future<List<StudentModel>> getallstudents(String batch_name) async {
  final attendanceDB = await Hive.openBox<StudentModel>('student_db');
  final studentList = attendanceDB.values.toList();

  final filteredList =
      studentList.where((student) => student.batch_name == batch_name).toList();

  filteredList.sort((a, b) => a.batch_name.compareTo(b.batch_name));
  filteredList.sort((a, b) => a.student_name.compareTo(b.student_name));
  studentListNotifier.value.addAll(filteredList);
  // ignore: invalid_use_of_protected_member
  studentListNotifier.notifyListeners();

  return filteredList;
}


// Future<void> getallstudents(String batch_name) async {
//   final attendanceDB = await Hive.openBox<StudentModel>('student_db');
//   //print(attendanceDB.length);
//   studentListNotifier.value.clear();
//   //print(studentListNotifier.value.length);
//   studentListNotifier.value.addAll(attendanceDB.values);
//   studentListNotifier.notifyListeners();
// }

// Future<void> deleteStudent(int id) async {
//   final attendanceDB = await Hive.openBox<StudentModel>('student_db');
//   await attendanceDB.deleteAt(id);
//   getallstudents();
// }

// Future<void> editStudentList(int id, StudentModel value) async {
//   final attendanceDB = await Hive.openBox<StudentModel>('student_db');
//   attendanceDB.putAt(id, value);
//   getallstudents();
// }
