
import "package:hive/hive.dart";

part 'chat_model.g.dart';

@HiveType(typeId: 0)
class ChatData extends HiveObject{
  // DateTime? start_date;
  @HiveField(0)
  String ChatId= "";

  @HiveField(1)
  String user1_Id = "";

  @HiveField(2)
  String user2_id = "";
  //need to add reference to chat messages data???
  ChatData(String user1_Id, String user2_Id) {
    this.user1_Id = user1_Id;
    this.user2_id = user2_Id;
  }
}
