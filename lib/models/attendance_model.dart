import 'package:hive/hive.dart';
part 'attendance_model.g.dart';

@HiveType(typeId: 3)
class attendance_model {
  @HiveField(0)
  List<dynamic> absent;
  // @HiveField(0)
  // String? id;

  // @HiveField(1)
  // final String register_number;

  // @HiveField(2)
  // final String student_name;

  // @HiveField(3)
  // DateTime date;

  // @HiveField(4)
  // bool isSelected;

  attendance_model({required this.absent
      // this.id,
      // required this.register_number,
      // required this.student_name,
      // required this.date,
      // required this.isSelected
      });
}
