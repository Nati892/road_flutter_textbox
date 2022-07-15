import 'package:hive/hive.dart';

part "message_model.g.dart";

@HiveType(typeId: 1)
class MessageData extends HiveObject {
@HiveType(typeId: 0)
  String ChatId = "";

  @HiveType(typeId: 1)
  String SenderId = "";

  @HiveType(typeId: 2)
  String ReceiverId = "";

  @HiveType(typeId: 3)
  DateTime TimeSent = DateTime.now();

  @HiveType(typeId: 4)
  DateTime? TimeRecieved;

  @HiveType(typeId: 5)
  DateTime? TimeRead;

  @HiveType(typeId: 6)
  bool? Forworded;

  @HiveType(typeId: 7)
  String MessageText = "";

  MessageData(this.SenderId, this.ReceiverId, this.TimeSent, this.Forworded,
      this.MessageText);
  MessageData.emptyConst() {}
}
