// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class batchmodelAdapter extends TypeAdapter<batch_model> {
  @override
  final int typeId = 1;

  @override
  batch_model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return batch_model(
      id: fields[0] as int?,
      batch_name: fields[1] as String,
      location: fields[2] as String,
      count: fields[3] as String,
      lead_name: fields[4] as String,
      phnNumber: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, batch_model obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.batch_name)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.count)
      ..writeByte(4)
      ..write(obj.lead_name)
      ..writeByte(5)
      ..write(obj.phnNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is batchmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
