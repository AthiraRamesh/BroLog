import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 2)
class student_model {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String register_number;

  @HiveField(2)
  final String student_name;

  @HiveField(3)
  final String domain;

  @HiveField(4)
  final String mobile;

  @HiveField(5)
  final String email_id;

  @HiveField(6)
  final String gender;

  @HiveField(7)
  final String batch_name;

  @HiveField(8)
  bool isSelected = false;

  student_model(
      {this.id,
      required this.register_number,
      required this.student_name,
      required this.domain,
      required this.mobile,
      required this.email_id,
      required this.gender,
      required this.batch_name,
      required this.isSelected});
}
