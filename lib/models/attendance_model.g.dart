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
      date: fields[0] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, attendance_model obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.date);
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
