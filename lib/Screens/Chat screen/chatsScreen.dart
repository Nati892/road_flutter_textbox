import 'package:firebase_learn/Chat/chat_data.dart';
import 'package:flutter/material.dart';

import 'chatsScreenWidgets.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final String route = "/showallchats";
  List<ChatData> UserChats = [
    ChatData("user1_Id", "user2_Id"),
    ChatData("another user1", "another user2")
  ]; //mock for the real dynamic deal, TODO: implement provider pattern
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
              itemCount: UserChats.length,
              itemBuilder: (BuildContext context, int i) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ListChatItem(Cdata: UserChats[i]),
                );
              })),
    );
  }
}
