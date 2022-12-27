// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_categories.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddCategoriesAdapter extends TypeAdapter<Add_Categories> {
  @override
  final int typeId = 2;

  @override
  Add_Categories read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Add_Categories(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Add_Categories obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imgPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddCategoriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
