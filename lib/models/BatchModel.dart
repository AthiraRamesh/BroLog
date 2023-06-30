import 'package:hive/hive.dart';
part 'BatchModel.g.dart';

@HiveType(typeId: 1)
class BatchModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String batch_name;

  @HiveField(2)
  final String location;

  @HiveField(3)
  final String count;

  @HiveField(4)
  final String lead_name;

  @HiveField(5)
  final String phnNumber;

  BatchModel({
    this.id,
    required this.batch_name,
    required this.location,
    required this.count,
    required this.lead_name,
    required this.phnNumber,
  });

  get propertyToSort => null;
}
