// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class attendancemodelAdapter extends TypeAdapter<attendance_model> {
  @override
  final int typeId = 3;

  @override
  attendance_model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return attendance_model(
      id: fields[0] as String?,
      register_number: fields[1] as String,
      student_name: fields[2] as String,
      date: fields[3] as DateTime,
      isSelected: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, attendance_model obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.register_number)
      ..writeByte(2)
      ..write(obj.student_name)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is attendancemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
