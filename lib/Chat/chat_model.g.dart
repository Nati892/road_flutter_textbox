// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatDataAdapter extends TypeAdapter<ChatData> {
  @override
  final int typeId = 0;

  @override
  ChatData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatData(fields[0] as String, fields[2] as String)
      ..ChatId = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, ChatData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ChatId)
      ..writeByte(1)
      ..write(obj.user1_Id)
      ..writeByte(2)
      ..write(obj.user2_id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
