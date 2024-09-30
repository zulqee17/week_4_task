// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoDbAdapter extends TypeAdapter<TodoDb> {
  @override
  final int typeId = 0;

  @override
  TodoDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoDb()
      ..key = fields[0] as dynamic
      ..title = fields[1] as String
      ..description = fields[2] as String
      ..isCompleted = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, TodoDb obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
