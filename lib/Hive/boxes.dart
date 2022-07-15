import 'package:hive_flutter/adapters.dart';

import '../Chat/chat_model.dart';
import '../Message/message_model.dart';
import '../User/user_model.dart';

class Boxes{
static Box<MessageData> getMessages()=>
  Hive.box<MessageData>('MessageData');

static Box<ChatData> getChats()=>
  Hive.box<ChatData>('ChatData');

  static Box<UserData> getUsers()=>
  Hive.box<UserData>('UserData');


  // await Hive.openBox<MessageDataAdapter>('MessageDataAdapter');
  // await Hive.openBox<ChatDataAdapter>('ChatDataAdapter');
  // await Hive.openBox<UserDataAdapter>('UserDataAdapter');
}