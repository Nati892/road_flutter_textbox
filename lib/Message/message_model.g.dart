// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageDataAdapter extends TypeAdapter<MessageData> {
  @override
  final int typeId = 1;

  @override
  MessageData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessageData.emptyConst();
  }

  @override
  void write(BinaryWriter writer, MessageData obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
