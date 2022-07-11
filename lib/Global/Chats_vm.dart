import 'package:flutter/material.dart';
import '../Chat/chat_data.dart';

class ChatsVM extends ChangeNotifier {
  List<ChatData> localChats = []; //will be reference to local db
  List<ChatData> userChats = []; //will be connected live to firestore
  ChatVM() {}

//add chat and return it
  // Future<ChatData> addChat(ChatData chat) async {
  //   notifyListeners();

  // }

//del chat
  Future<void> delChat(int chat) async {
    notifyListeners();
  }
}
