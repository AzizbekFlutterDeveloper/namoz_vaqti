// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelAdapter extends TypeAdapter<Model> {
  @override
  final int typeId = 0;

  @override
  Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Model(
      bomdod: fields[0] as bool?,
      quyosh: fields[1] as bool?,
      peshin: fields[2] as bool?,
      asr: fields[3] as bool?,
      shom: fields[4] as bool?,
      hufton: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Model obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.bomdod)
      ..writeByte(1)
      ..write(obj.quyosh)
      ..writeByte(2)
      ..write(obj.peshin)
      ..writeByte(3)
      ..write(obj.asr)
      ..writeByte(4)
      ..write(obj.shom)
      ..writeByte(5)
      ..write(obj.hufton);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
