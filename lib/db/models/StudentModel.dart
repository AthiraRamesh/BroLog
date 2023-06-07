import 'package:hive/hive.dart';
import '../models/BatchModel.dart';
part 'StudentModel.g.dart';

@HiveType(typeId: 2)
class StudentModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String student_name;

  @HiveField(2)
  final String domain;

  @HiveField(3)
  final String mobile;

  @HiveField(4)
  final String email_id;

  @HiveField(5)
  final String gender;

  @HiveField(6)
  final String batch_name;

  StudentModel({
    this.id,
    required this.student_name,
    required this.domain,
    required this.mobile,
    required this.email_id,
    required this.gender,
    required this.batch_name,
  });
}
