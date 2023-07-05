// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StudentModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 2;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      id: fields[0] as String?,
      student_name: fields[1] as String,
      domain: fields[2] as String,
      mobile: fields[3] as String,
      email_id: fields[4] as String,
      gender: fields[5] as String,
      batch_name: fields[6] as String,
      isSelected: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.student_name)
      ..writeByte(2)
      ..write(obj.domain)
      ..writeByte(3)
      ..write(obj.mobile)
      ..writeByte(4)
      ..write(obj.email_id)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.batch_name)
      ..writeByte(7)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
