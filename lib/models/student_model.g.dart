// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class studentmodelAdapter extends TypeAdapter<student_model> {
  @override
  final int typeId = 2;

  @override
  student_model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return student_model(
      id: fields[0] as String?,
      register_number: fields[1] as String,
      student_name: fields[2] as String,
      domain: fields[3] as String,
      mobile: fields[4] as String,
      email_id: fields[5] as String,
      gender: fields[6] as String,
      batch_name: fields[7] as String,
      isSelected: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, student_model obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.register_number)
      ..writeByte(2)
      ..write(obj.student_name)
      ..writeByte(3)
      ..write(obj.domain)
      ..writeByte(4)
      ..write(obj.mobile)
      ..writeByte(5)
      ..write(obj.email_id)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.batch_name)
      ..writeByte(8)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is studentmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
