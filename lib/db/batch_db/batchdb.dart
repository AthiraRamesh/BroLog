import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import '../models/BatchModel.dart';
import '../models/StudentModel.dart';
import 'package:hive/hive.dart';

abstract class BatchDbFunctions {
  Future<List<BatchModel>> getallbatches();
  Future<void> addBatch(BatchModel obj);
  Future<void> deleteBatch(int id);
}

class BatchDB implements BatchDbFunctions {
  BatchDB._internal();
  static BatchDB instance = BatchDB._internal();
  factory BatchDB() {
    return instance;
  }

  @override
  Future<void> addBatch(BatchModel obj) {
    // TODO: implement addBatch
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBatch(int id) {
    // TODO: implement deleteBatch
    throw UnimplementedError();
  }

  @override
  Future<List<BatchModel>> getallbatches() {
    // TODO: implement getallbatches
    throw UnimplementedError();
  }
}

ValueNotifier<List<BatchModel>> batchListNotifier = ValueNotifier([]);
ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
const ATTENDENCE_DB_NAME = 'attendance_db';
Future<void> addBatch(BatchModel value) async {
  final attendanceDB = await Hive.openBox<BatchModel>('attendance_db');

  await attendanceDB.add(value);
  print(value.toString());

  batchListNotifier.value.add(value);
  batchListNotifier.notifyListeners();
}

Future<void> getallbatches() async {
  final attendanceDB = await Hive.openBox<BatchModel>('attendance_db');
  batchListNotifier.value.clear();

  batchListNotifier.value.addAll(attendanceDB.values);
  batchListNotifier.notifyListeners();
}

Future<void> deleteBatch(int id) async {
  final attendanceDB = await Hive.openBox<BatchModel>('attendance_db');

  await attendanceDB.deleteAt(id);
  getallbatches();
}

Future<void> editBatchList(int id, BatchModel value) async {
  final attendanceDB = await Hive.openBox<BatchModel>('attendance_db');
  attendanceDB.putAt(id, value);
  getallbatches();
}
