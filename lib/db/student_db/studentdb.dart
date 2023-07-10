// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore_for_file: invalid_use_of_visible_for_testing_member, duplicate_ignore, invalid_use_of_protected_member

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import '../../models/student_model.dart';

const STUDENT_DB_NAME = 'student_db';

abstract class StudentDbFunctions {
  Future<List<student_model>> getallstudents();
  Future<void> addStudent(student_model obj);
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

// ignore: duplicate_ignore, duplicate_ignore
ValueNotifier<List<student_model>> studentListNotifier = ValueNotifier([]);
Future<void> addStudent(student_model value) async {
  final attendanceDB = await Hive.openBox<student_model>('student_db');
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

Future<void> getallstudents(String batch_name) async {
  final attendanceDB = await Hive.openBox<student_model>('student_db');
  //print(attendanceDB.length);
  studentListNotifier.value.clear();
  //print(studentListNotifier.value.length);
  final studentList = attendanceDB.values.toList();
  final filteredList =
      studentList.where((student) => student.batch_name == batch_name).toList();
  filteredList
      .sort((a, b) => a.student_name.compareTo(b.student_name)); //sorting
  filteredList.sort((a, b) => a.register_number.compareTo(b.register_number));
  // filteredList
  //     .sort((a, b) => a.register_number.compareTo(b.register_number)); //sorting
  studentListNotifier.value.addAll(filteredList);
  studentListNotifier.notifyListeners();
}

// Future<void> getallstudents(String batch_name) async {
//   final attendanceDB = await Hive.openBox<StudentModel>('student_db');
//   //print(attendanceDB.length);
//   studentListNotifier.value.clear();
//   //print(studentListNotifier.value.length);
//   studentListNotifier.value.addAll(attendanceDB.values);
//   studentListNotifier.notifyListeners();
// }

Future<void> deleteStudent(int id) async {
  final attendanceDB = await Hive.openBox<student_model>('student_db');

  await attendanceDB.deleteAt(id);
  // getallstudents(batch_name);
}

// Future<void> editStudentList(int id, StudentModel value) async {
//   final attendanceDB = await Hive.openBox<StudentModel>('student_db');
//   attendanceDB.putAt(id, value);
//   getallstudents();
// }
