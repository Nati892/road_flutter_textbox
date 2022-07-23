import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learn/Message/message_model.dart';
import 'package:firebase_learn/firebase_queries.dart';
import 'package:flutter/cupertino.dart';

class ChatVM extends ChangeNotifier {
  List<MessageData> chatMessages = [];
  String ChatId = "";
  String otherUsrId = "";
  String userId = "";

  ChatVM() {}

  ChatVM.withArgs(
      this.ChatId, this.userId, this.otherUsrId, this.chatMessages) {}

  void addMessage(MessageData msg) async {
    String id = await Firebase_queries()
        .sendMessage(FirebaseFirestore.instance, ChatId, msg);
    msg.ChatId = id;
    chatMessages.add(msg);
    notifyListeners();
  }

  void addMessageIninit(MessageData msg) {
    if (!chatMessages.any((element) => element.MessageId == msg.MessageId))
      chatMessages.add(msg);
  }

//TODO
  void removeMsg(MessageData msg) {
    if (chatMessages.contains(msg)) {
      chatMessages.add(msg);
      notifyListeners();
    }
  }
}
