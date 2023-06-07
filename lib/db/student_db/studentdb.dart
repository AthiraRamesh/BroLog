import 'package:Brolog/db/batch_db/batchdb.dart';
import 'package:Brolog/db/models/StudentModel.dart';
import 'package:hive_flutter/hive_flutter.dart';

const STUDENT_DB_NAME = 'student_db';

abstract class StudentDbFunctions {
  Future<List<StudentModel>> getallstudents();
  Future<void> addStudent(StudentModel obj);
  Future<void> deleteStudent(int id);
}

class StudentDB implements StudentDbFunctions {
  StudentDB._internal();
  static StudentDB instance = StudentDB._internal();
  factory StudentDB() {
    return instance;
  }

  @override
  Future<void> addStudent(StudentModel obj) {
    // TODO: implement addStudent
    throw UnimplementedError();
  }

  @override
  Future<void> deleteStudent(int id) {
    // TODO: implement deleteStudent
    throw UnimplementedError();
  }

  @override
  Future<List<StudentModel>> getallstudents() {
    // TODO: implement getallstudents
    throw UnimplementedError();
  }
}

Future<void> addStudent(StudentModel value) async {
  final attendanceDB = await Hive.openBox<StudentModel>('student_db');

  await attendanceDB.put(value.id, value);
  print(value.toString());

  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getallstudents() async {
  final attendanceDB = await Hive.openBox<StudentModel>('student_db');
  //print(attendanceDB.length);
  studentListNotifier.value.clear();
  //print(studentListNotifier.value.length);
  studentListNotifier.value.addAll(attendanceDB.values);
  studentListNotifier.notifyListeners();
}

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
