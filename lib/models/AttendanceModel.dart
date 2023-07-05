import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class AttendanceModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String student_name;

  @HiveField(2)
  DateTime date;

  @HiveField(7)
  bool isSelected;

  AttendanceModel(
      {this.id,
      required this.student_name,
      required this.date,
      required this.isSelected});
}
