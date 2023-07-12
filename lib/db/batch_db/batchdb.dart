import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import '../../models/batch_model.dart';

abstract class BatchDbFunctions {
  Future<List<batch_model>> getallbatches();
  Future<void> addBatch(batch_model obj);
  Future<void> deleteBatch(int id);
}

class BatchDB implements BatchDbFunctions {
  BatchDB._internal();
  static BatchDB instance = BatchDB._internal();
  factory BatchDB() {
    return instance;
  }

  @override
  Future<void> addBatch(batch_model obj) => throw UnimplementedError();

  @override
  Future<void> deleteBatch(int id) => throw UnimplementedError();

  @override
  Future<List<batch_model>> getallbatches() => throw UnimplementedError();
}

ValueNotifier<List<batch_model>> batchListNotifier = ValueNotifier([]);
const BATCH_DB_NAME = 'batch_db';
Future<void> addBatch(batch_model value) async {
  final attendanceDB = await Hive.openBox<batch_model>('batch_db');
  //final batchList = attendanceDB.values.toList();

  await attendanceDB.add(value);
  print(value);

  //batchListNotifier.value.add(value);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  batchListNotifier.notifyListeners();
}

Future<void> getallbatches() async {
  final attendanceDB = await Hive.openBox<batch_model>('batch_db');
  //print(attendanceDB.length);
  batchListNotifier.value.clear();

  batchListNotifier.value.addAll(attendanceDB.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  batchListNotifier.notifyListeners();
}

Future<void> deleteBatch(int id) async {
  final attendanceDB = await Hive.openBox<batch_model>('batch_db');

  await attendanceDB.deleteAt(id);
  getallbatches();
}

Future<void> editBatchList(int id, batch_model value) async {
  final attendanceDB = await Hive.openBox<batch_model>('batch_db');
  attendanceDB.putAt(id, value);
  getallbatches();
}
