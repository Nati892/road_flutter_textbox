import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learn/Message/message_model.dart';
import 'package:firebase_learn/firebase_queries.dart';
import 'package:flutter/cupertino.dart';

class ChatVM extends ChangeNotifier {
  List<MessageData> chatMessages = [];
  bool Initialzied = false;
  String ChatId = "";
  String otherUsrId = "";
  String userId = "";

  ChatVM() {}

  ChatVM.withArgs(
      this.ChatId, this.userId, this.otherUsrId, this.chatMessages) {
    print("called 'ChatVM.withARgs' ");
  }

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

  Future<void> syncFromSnapshot(AsyncSnapshot snapshot) async {
    print("***syncFromSnapshot started!!***");
    if (!Initialzied) {
      Initialzied = true;
      try {
        for (int i = 0; i < snapshot.data.docs.length; i++) {
          var FBmessageData = snapshot.data.docs[i];

          var currMSG = MessageData(
              FBmessageData["SenderId"],
              FBmessageData["ReceiverId"],
              FBmessageData["TimeSent"].toDate(),
              FBmessageData["Forworded"],
              FBmessageData["MessageText"],
              FBmessageData.id);

          if (!chatMessages
              .any((element) => element.MessageId == currMSG.MessageId)) {
            chatMessages.add(currMSG);
          }
        }
      } catch (e) {}
    }
  }

//TODO
  void removeMsg(MessageData msg) {
    if (chatMessages.contains(msg)) {
      chatMessages.add(msg);
      notifyListeners();
    }
  }
}
