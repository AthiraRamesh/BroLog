import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import '../../models/BatchModel.dart';

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
  Future<void> addBatch(BatchModel obj) => throw UnimplementedError();

  @override
  Future<void> deleteBatch(int id) => throw UnimplementedError();

  @override
  Future<List<BatchModel>> getallbatches() => throw UnimplementedError();
}

ValueNotifier<List<BatchModel>> batchListNotifier = ValueNotifier([]);
const BATCH_DB_NAME = 'batch_db';
Future<void> addBatch(BatchModel value) async {
  final attendanceDB = await Hive.openBox<BatchModel>('batch_db');
  //final batchList = attendanceDB.values.toList();

  await attendanceDB.add(value);
  //print(value.toString());

  //batchListNotifier.value.add(value);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  batchListNotifier.notifyListeners();
}

Future<void> getallbatches() async {
  final attendanceDB = await Hive.openBox<BatchModel>('batch_db');
  //print(attendanceDB.length);
  batchListNotifier.value.clear();

  batchListNotifier.value.addAll(attendanceDB.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  batchListNotifier.notifyListeners();
}

Future<void> deleteBatch(int id) async {
  final attendanceDB = await Hive.openBox<BatchModel>('batch_db');

  await attendanceDB.deleteAt(id);
  getallbatches();
}

Future<void> editBatchList(int id, BatchModel value) async {
  final attendanceDB = await Hive.openBox<BatchModel>('batch_db');
  attendanceDB.putAt(id, value);
  getallbatches();
}
